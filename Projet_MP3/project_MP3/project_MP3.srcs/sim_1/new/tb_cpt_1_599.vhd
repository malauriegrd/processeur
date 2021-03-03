----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 08:45:50
-- Design Name: 
-- Module Name: tb_cpt_1_599 - Behavioral
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

entity cpt_1_599_tb is
end;

architecture bench of cpt_1_599_tb is

  component cpt_1_599
      Port ( forward : in STD_LOGIC;
             restart : in STD_LOGIC;
             play_pause : in STD_LOGIC;
             reset : in STD_LOGIC;
             clock : in STD_LOGIC;
             CE_aff : in STD_LOGIC;
             timer : out STD_LOGIC_VECTOR (9 downto 0));
  end component;

  signal forward: STD_LOGIC;
  signal restart: STD_LOGIC;
  signal play_pause: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal clock: STD_LOGIC;
  signal CE_aff: STD_LOGIC;
  signal timer: STD_LOGIC_VECTOR (9 downto 0);

  constant clock_period: time := 10 ns;


begin

  uut: cpt_1_599 port map ( forward    => forward,
                            restart    => restart,
                            play_pause => play_pause,
                            reset      => reset,
                            clock      => clock,
                            CE_aff     => CE_aff,
                            timer      => timer );
  
   reset <= '0', '1' after 15ns;
   CE_aff <= '0', '1' after 20ns ; 
  stimulus: process
  begin
  
    -- Put initialisation code here

    -- Put test bench stimulus code here
    Play_pause <= '0'; 
        wait for 30ns; 
    Play_pause <= '1'; 
        wait for 300ns;
    Play_pause <= '0'; 
        wait for 300ns; 
    Forward <= '0'; 
        wait for 35ns; 
    Forward <= '1' ;
        wait for 150ns;
    Forward <= '0'; 
        wait for 150ns;   
        
    Restart <= '1' after 800ns ;  

  end process;

  clocking: process
  begin
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
  end process;

end;
