-- Ernesto Sola-Thomas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM is 
    generic(
        clock_frequency : integer := 100000000; -- 100MHz or 10ns period
        pwm_frequency : integer := 50;          -- 50Hz or 20ms period    
        control_min : integer := 0;
        control_max : integer := 1023           -- If using ADC map values to something like 0-1023
    );
    port(
        clk : in std_logic;
        reset_n : in std_logic; -- active low
        control_i : in std_logic_vector (31 downto 0);
        pwm_out : out std_logic := '0'
    );
end PWM;

architecture PWM_arch of PWM is 
    CONSTANT duty_cycle : integer := clock_frequency/pwm_frequency-1;
    signal pwm_high     : integer range 0 to duty_cycle := 0;
    signal active_pwm_high : integer range 0 to duty_cycle := 0;
    signal counter      : integer range 0 to duty_cycle := 0;
    
    signal control: integer;
begin 
    
    
    control <= to_integer(signed(control_i));
    pwm_high <= (control * duty_cycle) / control_max;
    
    PWM_gen : process (clk, reset_n) is
    begin 
        
        if (reset_n = '0') then
            pwm_out <= '0';
            counter <= 0;
            active_pwm_high <= pwm_high;
        elsif (rising_edge(clk)) then
            if (counter <= active_pwm_high) then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
            if (counter = duty_cycle) then 
                active_pwm_high <= pwm_high;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process PWM_gen;
end PWM_arch;