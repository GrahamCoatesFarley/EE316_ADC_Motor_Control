

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "PWM_ip" "NUM_INSTANCES" "DEVICE_ID"  "C_PWM_Hardware_BASEADDR" "C_PWM_Hardware_HIGHADDR"
}
