----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 17:06:17
-- Design Name: 
-- Module Name: tb_mod8 - Behavioral
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

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mod8_tb is
end;

architecture bench of mod8_tb is

  component mod8
      Port ( CE_perc : in STD_LOGIC;
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             AN : out STD_LOGIC_VECTOR (7 downto 0);
             commande : out STD_LOGIC_VECTOR (2 downto 0));
  end component;

  signal CE_perc: STD_LOGIC;
  signal clock: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal AN: STD_LOGIC_VECTOR (7 downto 0);
  signal commande: STD_LOGIC_VECTOR (2 downto 0);

  constant clock_period: time := 10 ns;

begin

  uut: mod8 port map ( CE_perc  => CE_perc,
                       clock    => clock,
                       reset    => reset,
                       AN       => AN,
                       commande => commande );
  
  
  stimulus: process
  begin
  
    -- Put initialisation code here
         CE_perc <= '0', '1' after 30ns ;
           reset <= '1', '0' after 10ns;

    -- Put test bench stimulus code here
wait;
  end process;

  clocking: process
  begin
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
  end process;

end;
  