--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_ff0d_wrapper.bd
--Design : bd_ff0d_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_ff0d_wrapper is
  port (
    SLOT_0_GPIO_tri_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end bd_ff0d_wrapper;

architecture STRUCTURE of bd_ff0d_wrapper is
  component bd_ff0d is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_GPIO_tri_o : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_ff0d;
begin
bd_ff0d_i: component bd_ff0d
     port map (
      SLOT_0_GPIO_tri_o(0) => SLOT_0_GPIO_tri_o(0),
      clk => clk,
      probe0(0) => probe0(0),
      probe1(0) => probe1(0),
      probe2(3 downto 0) => probe2(3 downto 0)
    );
end STRUCTURE;
