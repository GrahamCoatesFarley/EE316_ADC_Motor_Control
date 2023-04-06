library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM_ip_v1_0 is
	generic (
		-- Users to add parameters here
        clock_frequency : integer := 100000000; -- 100MHz or 10ns period
        pwm_frequency : integer := 50;          -- 50Hz or 20ms period    
        control_min : integer := 0;
        control_max : integer := 1023;          -- If using ADC map values to something like 0-1023
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface PWM_Hardware
		C_PWM_Hardware_DATA_WIDTH	: integer	:= 32;
		C_PWM_Hardware_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
        pwm_out : out std_logic := '0';
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface PWM_Hardware
		pwm_hardware_aclk	: in std_logic;
		pwm_hardware_aresetn	: in std_logic;
		pwm_hardware_awaddr	: in std_logic_vector(C_PWM_Hardware_ADDR_WIDTH-1 downto 0);
		pwm_hardware_awprot	: in std_logic_vector(2 downto 0);
		pwm_hardware_awvalid	: in std_logic;
		pwm_hardware_awready	: out std_logic;
		pwm_hardware_wdata	: in std_logic_vector(C_PWM_Hardware_DATA_WIDTH-1 downto 0);
		pwm_hardware_wstrb	: in std_logic_vector((C_PWM_Hardware_DATA_WIDTH/8)-1 downto 0);
		pwm_hardware_wvalid	: in std_logic;
		pwm_hardware_wready	: out std_logic;
		pwm_hardware_bresp	: out std_logic_vector(1 downto 0);
		pwm_hardware_bvalid	: out std_logic;
		pwm_hardware_bready	: in std_logic;
		pwm_hardware_araddr	: in std_logic_vector(C_PWM_Hardware_ADDR_WIDTH-1 downto 0);
		pwm_hardware_arprot	: in std_logic_vector(2 downto 0);
		pwm_hardware_arvalid	: in std_logic;
		pwm_hardware_arready	: out std_logic;
		pwm_hardware_rdata	: out std_logic_vector(C_PWM_Hardware_DATA_WIDTH-1 downto 0);
		pwm_hardware_rresp	: out std_logic_vector(1 downto 0);
		pwm_hardware_rvalid	: out std_logic;
		pwm_hardware_rready	: in std_logic
	);
end PWM_ip_v1_0;

architecture arch_imp of PWM_ip_v1_0 is

	-- component declaration
	component PWM_ip_v1_0_PWM_Hardware is
		generic (
		clock_frequency : integer := 100000000; -- 100MHz or 10ns period
        pwm_frequency : integer := 50;          -- 50Hz or 20ms period    
        control_min : integer := 0;
        control_max : integer := 1023;          -- If using ADC map values to something like 0-1023
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		pwm_out : out std_logic := '0';
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component PWM_ip_v1_0_PWM_Hardware;

begin

-- Instantiation of Axi Bus Interface PWM_Hardware
PWM_ip_v1_0_PWM_Hardware_inst : PWM_ip_v1_0_PWM_Hardware
	generic map (
	    clock_frequency => clock_frequency,
        pwm_frequency => pwm_frequency,
        control_min => control_min,
        control_max => control_max,
		C_S_AXI_DATA_WIDTH	=> C_PWM_Hardware_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_PWM_Hardware_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> pwm_hardware_aclk,
		S_AXI_ARESETN	=> pwm_hardware_aresetn,
		S_AXI_AWADDR	=> pwm_hardware_awaddr,
		S_AXI_AWPROT	=> pwm_hardware_awprot,
		S_AXI_AWVALID	=> pwm_hardware_awvalid,
		S_AXI_AWREADY	=> pwm_hardware_awready,
		S_AXI_WDATA	=> pwm_hardware_wdata,
		S_AXI_WSTRB	=> pwm_hardware_wstrb,
		S_AXI_WVALID	=> pwm_hardware_wvalid,
		S_AXI_WREADY	=> pwm_hardware_wready,
		S_AXI_BRESP	=> pwm_hardware_bresp,
		S_AXI_BVALID	=> pwm_hardware_bvalid,
		S_AXI_BREADY	=> pwm_hardware_bready,
		S_AXI_ARADDR	=> pwm_hardware_araddr,
		S_AXI_ARPROT	=> pwm_hardware_arprot,
		S_AXI_ARVALID	=> pwm_hardware_arvalid,
		S_AXI_ARREADY	=> pwm_hardware_arready,
		S_AXI_RDATA	=> pwm_hardware_rdata,
		S_AXI_RRESP	=> pwm_hardware_rresp,
		S_AXI_RVALID	=> pwm_hardware_rvalid,
		S_AXI_RREADY	=> pwm_hardware_rready,
		pwm_out => pwm_out
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
