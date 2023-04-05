// EE316 Project 5
// Digital System

/***************************** Include Files *********************************/

#include "xparameters.h"    // 
#include "xgpio.h"          // <= GPIO handler
#include "xil_printf.h"     //
#include "xil_exception.h"
#include "xtmrctr.h"
#include "xscugic.h"
#include "xadcps.h"
#include "xstatus.h"

#include "PWM.h"
#include "xsysmon.h"
#include "xparameters.h"
#include "sleep.h"
#include "stdio.h"
#include "xgpio.h"
#include "xil_types.h"
#include "debounce.h"

/************************** RGB Constant Definitions ************************/

// Color Masks
#define RGB_All 0x3F    // ALL '1' 
#define RGB_0 0x07      // 000 111
#define RGB_1 0x38      // 111 000

/************************** Timer PWM Constant Definitions ************************/

#define PWM_FREQUENCY		1000	// PWM frequency in Hz
#define PWM_DUTY_CYCLE		50		// PWM duty cycle in percentage
u32 PWM_period;
u32 PWM_high_time;
u32 PWM_low_time;

/************************** LCD Constant Definitions ************************/

#define RS 0x01
#define EN 0x02
#define LCD_CHANNEL_NUM 1

/************************** Device ID Definitions ***************************/

#define reset_output_ID 		XPAR_SYSTEM_RESET_DEVICE_ID   // <= AXI_GPIO reset output signal (0 downto 0) OUTPUT
#define RGB_LED_ID 				XPAR_RGB_LEDS_DEVICE_ID        // <= AXI_GPIO RGB interface INPUT
#define PWM_ip_ID 				XPAR_PWM_IP_0_DEVICE_ID
#define LCD_ID 					XPAR_LCD_AXI_GPIO_DEVICE_ID
#define Timer_AXI_ID 			XPAR_PWM_TIMER_DEVICE_ID
#define XADC_DEVICE_ID 			XPAR_XADCPS_0_DEVICE_ID
#define PMOD_BTN_ID				XPAR_PMOD_BTN_DEVICE_ID

#define PWM_ip_base_address 0x43C00000 // AZI4 uses direct memory write 'Xil_32()'

#define AXI_GPIO_Default_CH 1

XGpio RGB_inst;         /* The Instance of the RGB Driver */
XGpio reset_inst;       /* The Instance of the Reset Driver */
XGpio PWM_ip_inst;      /* The Instance of the PWM Driver*/
XGpio LCD_inst;         /* The Instance of the LCD Driver*/
XGpio PMOD_BTN_inst; /* The Instance of the GPIO Driver */


XScuGic Intc; /* The Instance of the Interrupt Controller Driver */

XTmrCtr Timer_inst; /* The Instance of the timer Driver*/

// ######################## ADC Definitions here #########################

#define RGBLED_BASEADDR XPAR_PWM_0_PWM_AXI_BASEADDR
#define LED_ON_DUTY 0x3FFF
#define LED_OFF_DUTY 0x3000
#define XADC_DEVICE_ID XPAR_XADC_WIZ_0_DEVICE_ID
#define BTN_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
// Channels 0, 1, 5, 6, 8, 9, 12, 13, 15, VPVN are available
// Channels 0, 8, 12 are differential 1.0V max
// Channels 1, 5, 6, 9, 13, 15 are single-ended 3.3V max
// All channels should be used in differential input mode
#define XADC_SEQ_CHANNELS 0xB3630800
#define XADC_CHANNELS 0xB3630008
#define NUMBER_OF_CHANNELS 2
const u8 Channel_List[NUMBER_OF_CHANNELS] = {
	//3, // Start with VP/VN
	//28, 16, 24, // Diff. Channels in ascending order
	//17, 25, 22, 31, 21, 29 // Single-Ended Channels in ascending order
	17, 25
}; // 00008
const char *Channel_Names[32] = {
	"", "", "", "VP-VN",
	"", "", "", "",
	"", "", "", "",
	"", "", "", "",
	"A8-A9", "A0", "", "",
	"", "A4", "A2", "",
	"A10-A11", "A1", "", "",
	"A6-A7", "A5", "", "A3"
};





/************************** System Interrupt ID Definitions ***************************/

#define INTC_PMOD_BTN_INTERRUPT_ID	XPAR_FABRIC_PMOD_BTN_IP2INTC_IRPT_INTR
#define PWM_TIMER_INTERRUPT_ID 		XPAR_FABRIC_PWM_TIMER_INTERRUPT_INTR

#define INTC_DEVICE_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID
#define INTC			XScuGic
#define INTC_HANDLER	XScuGic_InterruptHandler

static u16 GlobalIntrMask = 1; /* GPIO channel mask that is needed by the Interrupt Handler */
static volatile u32 IntrFlag; /* Interrupt Handler Flag */

// Define loop delay (TEMPORARY)
#define LED_DELAY     100000000

/************************** Function Declaration ************************/

// PWM Hardware IP
void setup (void); // Function to initialize global variables and interfaces
void system_delay (int wait_for);
void pwm_write (int *intensity, int *direction);

// ADC
// static int XAdcPolledxil_printfExample(u16 XAdcDeviceId);
// static int XAdcFractionToInt(float FloatNum);

// LCD Software
void LCD_nibble_write(char data, unsigned char control);
void LCD_command(unsigned char command);
void LCD_init(void);
void LCD_data(char data);
void LCD_write_line(char* cstring);
void LCD_clear_all(void); // Clear both lines
void LCD_set_line(int line); // Clear line and set to position 1

// Interrupt Functions
void GpioHandler(void *CallBackRef);

int GpioIntrExample(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 DeviceId, u16 IntrId,
			u16 IntrMask, u32 *DataRead);

int GpioSetupIntrSystem(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 DeviceId, u16 IntrId, u16 IntrMask);

void GpioDisableIntr(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 IntrId, u16 IntrMask);

// Temporary LCD delay function

void delayms(int n);

// ######################## ADC Function Definitions here #########################

void Xadc_Init(XSysMon *InstancePtr, u32 DeviceId); 

#define READDATA_DBG 0
u32 Xadc_ReadData (XSysMon *InstancePtr, u16 RawData[32]);

float Xadc_RawToVoltage(u16 Data, u8 Channel); 

int PWM_DUTY_CYCLE_INT(u16 XADC_Data);


/************************** main *****************************/
int main(void)
{
	xil_printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\r");
    xil_printf("setup...\n\n\r");
    setup(); // Initialize interfaces
    
    xil_printf("Running infinite loop...\n\r");

    int PWM_inensity = 0;
    int direction = 1;

    while (1) {
        // Set RGB 0 to white RGB 1 off
        XGpio_DiscreteWrite(&RGB_inst, AXI_GPIO_Default_CH, RGB_0);
        pwm_write(&PWM_inensity, &direction);

        LCD_set_line(2);
        LCD_write_line("Nathan 1");

        system_delay(LED_DELAY);

        // Set RGB 0 to off  RGB 1 to while
        XGpio_DiscreteWrite(&RGB_inst, AXI_GPIO_Default_CH, RGB_1);
        pwm_write(&PWM_inensity, &direction);

        LCD_set_line(2);
        LCD_write_line("Nathan 2 ABC");

        system_delay(LED_DELAY);
    }
}



/************************** setup function declaration ************************/

void setup (void){

    int Status;

    /* THERE IS NO NEED TO SET DIRECTION IF IT WAS DONE ON HARDWARE*/

    // Initialize reset GPIO driver
    Status = XGpio_Initialize(&reset_inst, reset_output_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("reset GPIO Initialization Failed\r\n");
	}else{
		xil_printf("Reset AXI_GPIO initialized / ");
	}
	// Initialize RGB GPIO driver
    Status = XGpio_Initialize(&RGB_inst, RGB_LED_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("RGB GPIO Initialization Failed\r\n");
	}else{
        XGpio_DiscreteClear(&RGB_inst, AXI_GPIO_Default_CH, RGB_All); // Clear all LED (set to zero)
		xil_printf("RGB AXI_GPIO initialized / ");
	}

	// Initialize PMOD BTN GPIO driver
	Status = XGpio_Initialize(&PMOD_BTN_inst, PMOD_BTN_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("PMOD GPIO Initialization Failed\r\n");
	}else{
		XGpio_DiscreteClear(&RGB_inst, AXI_GPIO_Default_CH, RGB_All); // Clear all LED (set to zero)
		xil_printf("PMOD_BTN AXI_GPIO initialized \n\n\r");
	}
    // Initialize PWM IP GPIO driver
    Status = XGpio_Initialize(&PWM_ip_inst, PWM_ip_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("PWM_ip GPIO Initialization Failed\r\n");
	}else{
        XGpio_SetDataDirection(&PWM_ip_inst, 1, 0x00);  // set all pins as output 
        Xil_Out32(PWM_ip_base_address, 0x64);          // Set hardware PWM output to 50% duty cycle
        xil_printf("PWM_ip AXI_GPIO initialized \n\r");
	}

	// Initialize LCD
    Status = XGpio_Initialize(&LCD_inst, LCD_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("LCD AXI_GPIO Initialization Failed\r\n");
	}else{
		XGpio_SetDataDirection(&LCD_inst, LCD_CHANNEL_NUM, 0x00);
        LCD_init();
        LCD_command(0x85);
        LCD_write_line("Nathan");
        LCD_command(0xC0);
        LCD_write_line("Line 2");
        //lcd_write_string(DisplayMsg1, 1);
        //lcd_write_string(DisplayMsg2, 2);
        xil_printf("LCD, Initialized.... Nathan\n\r");
	}
	
    // Initialize PWM timer
    Status = XTmrCtr_Initialize(&Timer_inst, Timer_AXI_ID);
    if (Status != XST_SUCCESS) {
        xil_printf("Timer PWM AXI Initialization Failed\r\n");
    }else{

        int pwm_config_staus;
        pwm_config_staus = XTmrCtr_PwmConfigure(&Timer_inst, 500000000, 800);

        xil_printf("Timer PWM initialized at period\r\n");
    }

    // Initialize ADC

    // Initialize PWM_BTN Interrupt
    int Result_PWM_BTN;
    XScuGic_Config *IntcConfig;
    IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
    Result_PWM_BTN = XScuGic_CfgInitialize(&Intc, IntcConfig,
    					IntcConfig->CpuBaseAddress);
    XScuGic_SetPriorityTriggerType(&PMOD_BTN_inst, INTC_PMOD_BTN_INTERRUPT_ID,
    					0xA0, 0x3);

//	Status = GpioSetupIntrSystem(&Intc, &PMOD_BTN_inst, &PMOD_BTN_ID,
//			INTC_GPIO_INTERRUPT_ID, LCD_CHANNEL_NUM);
//	if (Status != XST_SUCCESS) {
//		xil_printf("PWM_BTN interrupt Initialization Failed\r\n");
//	}else{
//		xil_printf("PWM_BTN interrupt initialized\r\n");
//	}

	// ^^^^ Something similar for timer interrupts



    // Setup Compete
    xil_printf("-------------------SETUP COMPLETE--------------------\n\n\r");
}

/************************** System Delay Function ************************/

void system_delay (int wait_for) {
    volatile int Delay;
    for (Delay = 0; Delay < wait_for; Delay++);
}
/************************** PWM Intensity ************************/
#define pwm_step_test_1 16
#define pwm_step_test_2 32
#define pwm_step_test_3 64

void pwm_write (int *intensity, int *direction){
	if (*intensity >= 1023){
		*direction = 0;
	}else if (*intensity <= 0){
		*direction = 1;
	}

	Xil_Out32(PWM_ip_base_address, *intensity);

	if (*direction == 0){
		*intensity = *intensity - pwm_step_test_3;
	}else if (*direction == 1){
		*intensity = *intensity + pwm_step_test_3;
	}
}

/************************** LCD Functions ************************/

//  Clear line 1 ==> 0x01
//  Clear line 2 ==> 0x01 + 0x40 = 0x41

/* This command clears the DDRAM and returns the cursor to the beginning of the second line.
 * The DDRAM address for the second line starts at 0x40, so we add this value to the clear command for line 1 to clear the second line. */


//this function always takes in 8 bits and only sends the top 4 (MSB most significant bits)
//also assuming that the control parameter is either 0 or RS, so (RS & RS) equals 1 and executes the if statement
void LCD_nibble_write(char data, unsigned char control) {

	volatile uint8_t the6bits = 0x00;

	the6bits |= (data >> 4);

	/* set R/S bit */
	if (control & RS) {
		//GPIOB->BSRR = RS;
	the6bits |= (RS << 4); //(data & 0xF0)
	}
	else {
		//GPIOB->BSRR = RS << 16;
	the6bits &= ~(RS << 4);
	}

	the6bits &= ~(EN << 4);

	XGpio_DiscreteWrite(&LCD_inst, LCD_CHANNEL_NUM, the6bits);

	/* pulse E */
	//GPIOB->BSRR = EN;
	the6bits |= EN << 4;
	XGpio_DiscreteWrite(&LCD_inst, LCD_CHANNEL_NUM, the6bits);

	// xil_printf("%X\r\n", the6bits);

	//set
	delayms(0);
	//clear
	the6bits &= ~(EN << 4);
	XGpio_DiscreteWrite(&LCD_inst, LCD_CHANNEL_NUM, the6bits);

	// xil_printf("%X\r\n", the6bits);
}

void LCD_command(unsigned char command){

LCD_nibble_write(command & 0xF0, 0);    /* upper nibble first */
LCD_nibble_write(command << 4, 0);      /* then lower nibble */

if (command < 4)
	delayms(2);             //command 1 and 2 needs up to 1.64ms
else
	delayms(1);             //all others need 40 us (microseconds?)
}

void LCD_init(void){

	delayms(20);                /* LCD controller reset sequence */
	  LCD_nibble_write(0x30, 0);
	  delayms(5);
	  LCD_nibble_write(0x30, 0);
	  delayms(1);
	  LCD_nibble_write(0x30, 0);
	  delayms(1);

	LCD_nibble_write(0x20, 0);  /* use 4-bit data mode */
	delayms(1);


	LCD_command(0x28); /* set 4-bit data, 2-line, 5x7 font */
	LCD_command(0x06);  //move cursor right after each char sent
	LCD_command(0x01);  //clear screen, move cursor to home
	LCD_command(0x0C);  //turn on display, cursor blinking 0x0F, cursor not blinking and not being display = 0x0C
	//1100 = 0xC
}

void LCD_data(char data){
	LCD_nibble_write(data & 0xF0, RS); //upper nibble first
	LCD_nibble_write(data << 4, RS);   //lower nibble
	delayms(1);
}

void LCD_write_line(char* cstring){

	uint8_t ch;
	for(ch=0; cstring[ch] != 0; ch++){
		LCD_data(cstring[ch]);
	}
}

void LCD_clear_all(void){
	LCD_command(0x01);
	LCD_command(0x41);
	LCD_command(0x80);
}

void LCD_set_line(int line){
	// line must be either 1 or 2

	if (line == 1) {
		LCD_command(0x01); // Clear Line 1
		LCD_command(0x80); // Set cursor to first position line 1
	}else if (line == 2){
		LCD_command(0x41); // Clear Line 2
		LCD_command(0xC0); // Set cursor to first position line 2
	}
}

void delayms(int n){
int i;
for(; n>0; n--)
for(i=0; i<50000; i++) ; //3195
}

/************************** ADC Functions ************************/

// ######################## ADC Function Definitions here #########################

void Xadc_Init(XSysMon *InstancePtr, u32 DeviceId) {
	XSysMon_Config *ConfigPtr;
	ConfigPtr = XSysMon_LookupConfig(DeviceId);
	XSysMon_CfgInitialize(InstancePtr, ConfigPtr, ConfigPtr->BaseAddress);

	// Disable the Channel Sequencer before configuring the Sequence registers.
	XSysMon_SetSequencerMode(InstancePtr, XSM_SEQ_MODE_SAFE);
	// Disable all alarms
	XSysMon_SetAlarmEnables(InstancePtr, 0x0);
	// Set averaging for all channels to 16 samples
	XSysMon_SetAvg(InstancePtr, XSM_AVG_16_SAMPLES);
	// Set differential input mode for channels VP_VN, AUX0, AUX8, AUX12 and unipolar input mode for the rest
	XSysMon_SetSeqInputMode(InstancePtr, XSM_SEQ_CH_VPVN | XSM_SEQ_CH_AUX00 | XSM_SEQ_CH_AUX08 | XSM_SEQ_CH_AUX12);
	// Set 6ADCCLK acquisition time in all channels
	XSysMon_SetSeqAcqTime(InstancePtr, XADC_SEQ_CHANNELS);
	// Disable averaging in all channels
	XSysMon_SetSeqAvgEnables(InstancePtr, XADC_SEQ_CHANNELS);
	// Enable all channels
	XSysMon_SetSeqChEnables(InstancePtr, XADC_SEQ_CHANNELS);
	// Set the ADCCLK frequency equal to 1/32 of System clock
	XSysMon_SetAdcClkDivisor(InstancePtr, 32);
	// Enable Calibration
	XSysMon_SetCalibEnables(InstancePtr, XSM_CFR1_CAL_PS_GAIN_OFFSET_MASK | XSM_CFR1_CAL_ADC_GAIN_OFFSET_MASK);
	// Enable the Channel Sequencer in continuous sequencer cycling mode
	XSysMon_SetSequencerMode(InstancePtr, XSM_SEQ_MODE_CONTINPASS);
	// Clear the old status
//	XSysMon_GetStatus(InstancePtr);
}

u32 Xadc_ReadData (XSysMon *InstancePtr, u16 RawData[32])
{
	u8 Channel;

	if (READDATA_DBG != 0)
		xil_printf("Waiting for EOS...\r\n");

	// Clear the Status
	XSysMon_GetStatus(InstancePtr);
	// Wait until the End of Sequence occurs
	while ((XSysMon_GetStatus(InstancePtr) & XSM_SR_EOS_MASK) != XSM_SR_EOS_MASK);

	if (READDATA_DBG != 0)
		xil_printf("Capturing XADC Data...\r\n");

	for (Channel=0; Channel<32; Channel++) {
		if (((1 << Channel) & XADC_CHANNELS) != 0) {
			if (READDATA_DBG != 0)
				xil_printf("Capturing Data for Channel %d\r\n", Channel);
			RawData[Channel] = XSysMon_GetAdcData(InstancePtr, Channel);
		}
	}
	return XADC_CHANNELS; // return a high bit for each channel successfully read
}

float Xadc_RawToVoltage(u16 Data, u8 Channel) {
	float FloatData;
	float Scale;
	int Sign;

	switch (Channel) {
	case 3: // VP/VN (Cora Dedicated Analog Input)
	case 16: // AUX0 (Cora A8/A9 Diff. Analog Input)
	case 24: // AUX8 (Cora A10/A11 Diff. Analog Input)
	case 28: Scale = 0.5; Sign = 1; break; // AUX12 (Cora A6/A7 Diff. Analog Input)
	case 17: // AUX1 (Cora A0 Single-Ended Analog Input)
	case 21: // AUX5 (Cora A4 Single-Ended Analog Input)
	case 22: // AUX6 (Cora A2 Single-Ended Analog Input)
	case 25: // AUX9 (Cora A1 Single-Ended Analog Input)
	case 29: // AUX13 (Cora A5 Single-Ended Analog Input)
	case 31: Scale = 3.3; Sign = 0; break; // AUX15 (Cora A3 Single-Ended Analog Input)
	default: Scale = 0.0;
	}
	if (Sign && Test_Bit(Data, 15)) {
		FloatData = -Scale;
		Data = ~Data + 1;
	} else
		FloatData = Scale;
	if (Sign)
		FloatData *= (float)Data / (float)0x7FF0;
	else
		FloatData *= (float)Data / (float)0xFFF0;
	return FloatData;
}

int PWM_DUTY_CYCLE_INT(u16 XADC_Data){
	int value = (int)XADC_Data;
	//printf("Value: %d \n", value);
	int MAX_VALUE = 65536;
	float percentage = ((float)value)/((float)MAX_VALUE);

	float PWM_DUTY = 100*percentage;
	//printf("Duty float: %d \n", PWM_DUTY);
	int PWM_DUTY_int = (int)PWM_DUTY;
	printf("Duty : %d \n", PWM_DUTY_int);
	return PWM_DUTY_int;
}








/************************** Interrupt Functions ************************/

int GpioIntrExample(INTC *IntcInstancePtr, XGpio* InstancePtr, u16 DeviceId,
			u16 IntrId, u16 IntrMask, u32 *DataRead)
{
	int Status;
	u32 delay;

	/* Initialize the GPIO driver. If an error occurs then exit */
	Status = XGpio_Initialize(InstancePtr, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = GpioSetupIntrSystem(IntcInstancePtr, InstancePtr, DeviceId,
					IntrId, IntrMask);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	IntrFlag = 0;
	delay = 0;

	while(!IntrFlag && (delay < 0xFFFFFFFF)) {
		delay++;
	}

	GpioDisableIntr(IntcInstancePtr, InstancePtr, IntrId, IntrMask);

	*DataRead = IntrFlag;

	return Status;
}


/******************************************************************************/
/**
*
* This function performs the GPIO set up for Interrupts
*
* @param	IntcInstancePtr is a reference to the Interrupt Controller
*		driver Instance
* @param	InstancePtr is a reference to the GPIO driver Instance
* @param	DeviceId is the XPAR_<GPIO_instance>_DEVICE_ID value from
*		xparameters.h
* @param	IntrId is XPAR_<INTC_instance>_<GPIO_instance>_IP2INTC_IRPT_INTR
*		value from xparameters.h
* @param	IntrMask is the GPIO channel mask
*
* @return	XST_SUCCESS if the Test is successful, otherwise XST_FAILURE
*
* @note		None.
*
******************************************************************************/
int GpioSetupIntrSystem(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 DeviceId, u16 IntrId, u16 IntrMask)
{
	int Result;

	GlobalIntrMask = IntrMask;


	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Result = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Result != XST_SUCCESS) {
		return XST_FAILURE;
	}


	XScuGic_SetPriorityTriggerType(IntcInstancePtr, IntrId,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Result = XScuGic_Connect(IntcInstancePtr, IntrId,
				 (Xil_ExceptionHandler)GpioHandler, InstancePtr);
	if (Result != XST_SUCCESS) {
		return Result;
	}

	/* Enable the interrupt for the GPIO device.*/
	XScuGic_Enable(IntcInstancePtr, IntrId);

	/*
	 * Enable the GPIO channel interrupts so that push button can be
	 * detected and enable interrupts for the GPIO device
	 */
	XGpio_InterruptEnable(InstancePtr, IntrMask);
	XGpio_InterruptGlobalEnable(InstancePtr);

	/*
	 * Initialize the exception table and register the interrupt
	 * controller handler with the exception table
	 */
	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)INTC_HANDLER, IntcInstancePtr);

	/* Enable non-critical exceptions */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

/******************************************************************************/
/**
*
* This is the interrupt handler routine for the GPIO for this example.
*
* @param	CallbackRef is the Callback reference for the handler.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void GpioHandler(void *CallbackRef)
{
	XGpio *GpioPtr = (XGpio *)CallbackRef;

	IntrFlag = 1;

	/* Clear the Interrupt */
	XGpio_InterruptClear(GpioPtr, GlobalIntrMask);

}

/******************************************************************************/
/**
*
* This function disables the interrupts for the GPIO
*
* @param	IntcInstancePtr is a pointer to the Interrupt Controller
*		driver Instance
* @param	InstancePtr is a pointer to the GPIO driver Instance
* @param	IntrId is XPAR_<INTC_instance>_<GPIO_instance>_VEC
*		value from xparameters.h
* @param	IntrMask is the GPIO channel mask
*
* @return	None
*
* @note		None.
*
******************************************************************************/
void GpioDisableIntr(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 IntrId, u16 IntrMask)
{
	XGpio_InterruptDisable(InstancePtr, IntrMask);

	/* Disconnect the interrupt */
	XScuGic_Disable(IntcInstancePtr, IntrId);
	XScuGic_Disconnect(IntcInstancePtr, IntrId);

	return;
}

/************************** tmp ************************/

/************************** tmp ************************/

/************************** tmp ************************/

/************************** tmp ************************/

/************************** tmp ************************/

/************************** tmp ************************/

/************************** tmp ************************/

