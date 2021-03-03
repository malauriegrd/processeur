----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 08:10:59
-- Design Name: 
-- Module Name: tb_clock - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_clock is
end;

architecture bench of tb_clock is

  component gestion_freq
      Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             CE_aff : out STD_LOGIC;
             CE_perc : out STD_LOGIC);
  end component;

  signal clock: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal CE_aff: STD_LOGIC;
  signal CE_perc: STD_LOGIC;

  constant clock_period: time := 10 ns;

begin

  uut: gestion_freq port map ( clock   => clock,
                               reset   => reset,
                               CE_aff  => CE_aff,
                               CE_perc => CE_perc );

  stimulus: process
  begin
  
    -- Put initialisation code here

    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Put test bench stimulus code here
    
    wait;
  end process;

  clocking: process
  begin
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
  end process;

end;
  