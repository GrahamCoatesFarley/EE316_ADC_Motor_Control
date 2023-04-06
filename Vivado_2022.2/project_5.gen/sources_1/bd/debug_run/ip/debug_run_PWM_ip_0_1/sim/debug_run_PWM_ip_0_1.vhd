-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: solathomas.com:sola-thomas:PWM_ip:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY debug_run_PWM_ip_0_1 IS
  PORT (
    pwm_out : OUT STD_LOGIC;
    pwm_hardware_aclk : IN STD_LOGIC;
    pwm_hardware_aresetn : IN STD_LOGIC;
    pwm_hardware_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pwm_hardware_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pwm_hardware_awvalid : IN STD_LOGIC;
    pwm_hardware_awready : OUT STD_LOGIC;
    pwm_hardware_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    pwm_hardware_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pwm_hardware_wvalid : IN STD_LOGIC;
    pwm_hardware_wready : OUT STD_LOGIC;
    pwm_hardware_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pwm_hardware_bvalid : OUT STD_LOGIC;
    pwm_hardware_bready : IN STD_LOGIC;
    pwm_hardware_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pwm_hardware_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    pwm_hardware_arvalid : IN STD_LOGIC;
    pwm_hardware_arready : OUT STD_LOGIC;
    pwm_hardware_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pwm_hardware_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pwm_hardware_rvalid : OUT STD_LOGIC;
    pwm_hardware_rready : IN STD_LOGIC
  );
END debug_run_PWM_ip_0_1;

ARCHITECTURE debug_run_PWM_ip_0_1_arch OF debug_run_PWM_ip_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF debug_run_PWM_ip_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT PWM_ip_v1_0 IS
    GENERIC (
      C_PWM_Hardware_DATA_WIDTH : INTEGER;
      C_PWM_Hardware_ADDR_WIDTH : INTEGER;
      clock_frequency : INTEGER;
      pwm_frequency : INTEGER;
      control_min : INTEGER;
      control_max : INTEGER
    );
    PORT (
      pwm_out : OUT STD_LOGIC;
      pwm_hardware_aclk : IN STD_LOGIC;
      pwm_hardware_aresetn : IN STD_LOGIC;
      pwm_hardware_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pwm_hardware_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pwm_hardware_awvalid : IN STD_LOGIC;
      pwm_hardware_awready : OUT STD_LOGIC;
      pwm_hardware_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      pwm_hardware_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pwm_hardware_wvalid : IN STD_LOGIC;
      pwm_hardware_wready : OUT STD_LOGIC;
      pwm_hardware_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pwm_hardware_bvalid : OUT STD_LOGIC;
      pwm_hardware_bready : IN STD_LOGIC;
      pwm_hardware_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pwm_hardware_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pwm_hardware_arvalid : IN STD_LOGIC;
      pwm_hardware_arready : OUT STD_LOGIC;
      pwm_hardware_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pwm_hardware_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pwm_hardware_rvalid : OUT STD_LOGIC;
      pwm_hardware_rready : IN STD_LOGIC
    );
  END COMPONENT PWM_ip_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF pwm_hardware_aclk: SIGNAL IS "XIL_INTERFACENAME PWM_Hardware_CLK, ASSOCIATED_BUSIF PWM_Hardware, ASSOCIATED_RESET pwm_hardware_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN debug_run_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 PWM_Hardware_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware ARADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF pwm_hardware_aresetn: SIGNAL IS "XIL_INTERFACENAME PWM_Hardware_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 PWM_Hardware_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF pwm_hardware_awaddr: SIGNAL IS "XIL_INTERFACENAME PWM_Hardware, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN debug_run_processing" & 
"_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF pwm_hardware_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 PWM_Hardware WVALID";
BEGIN
  U0 : PWM_ip_v1_0
    GENERIC MAP (
      C_PWM_Hardware_DATA_WIDTH => 32,
      C_PWM_Hardware_ADDR_WIDTH => 4,
      clock_frequency => 100000000,
      pwm_frequency => 50,
      control_min => 0,
      control_max => 1024
    )
    PORT MAP (
      pwm_out => pwm_out,
      pwm_hardware_aclk => pwm_hardware_aclk,
      pwm_hardware_aresetn => pwm_hardware_aresetn,
      pwm_hardware_awaddr => pwm_hardware_awaddr,
      pwm_hardware_awprot => pwm_hardware_awprot,
      pwm_hardware_awvalid => pwm_hardware_awvalid,
      pwm_hardware_awready => pwm_hardware_awready,
      pwm_hardware_wdata => pwm_hardware_wdata,
      pwm_hardware_wstrb => pwm_hardware_wstrb,
      pwm_hardware_wvalid => pwm_hardware_wvalid,
      pwm_hardware_wready => pwm_hardware_wready,
      pwm_hardware_bresp => pwm_hardware_bresp,
      pwm_hardware_bvalid => pwm_hardware_bvalid,
      pwm_hardware_bready => pwm_hardware_bready,
      pwm_hardware_araddr => pwm_hardware_araddr,
      pwm_hardware_arprot => pwm_hardware_arprot,
      pwm_hardware_arvalid => pwm_hardware_arvalid,
      pwm_hardware_arready => pwm_hardware_arready,
      pwm_hardware_rdata => pwm_hardware_rdata,
      pwm_hardware_rresp => pwm_hardware_rresp,
      pwm_hardware_rvalid => pwm_hardware_rvalid,
      pwm_hardware_rready => pwm_hardware_rready
    );
END debug_run_PWM_ip_0_1_arch;
