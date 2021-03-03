----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 08:23:42
-- Design Name: 
-- Module Name: tb_cpt_1_9 - Behavioral
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

entity cpt_1_9_tb is
end;

architecture bench of cpt_1_9_tb is

  component cpt_1_9
      Port ( volume_up : in STD_LOGIC;
             volume_down : in STD_LOGIC;
             clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             volume : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal volume_up: STD_LOGIC;
  signal volume_down: STD_LOGIC;
  signal clock: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal volume: STD_LOGIC_VECTOR (3 downto 0);

  constant clock_period: time := 10 ns;

begin

  uut: cpt_1_9 port map ( volume_up   => volume_up,
                          volume_down => volume_down,
                          clock       => clock,
                          reset       => reset,
                          volume      => volume );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '0', '1' after 15ns;
    
    -- Put test bench stimulus code here
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
        
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
        
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
        
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
        
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
                
    volume_up <= '1' ;
       wait for 5 ns; 
    volume_up <= '0'; 
        wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
        wait for 5ns;

    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
        wait for 5ns;    

    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
        wait for 5ns;  
        
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
        wait for 5ns;        
        
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
    wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
    wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
    wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
    wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
    wait for 5ns;
    
    volume_down <= '1' ;
        wait for 5 ns; 
    volume_down <= '0'; 
        wait for 5ns;
                              
  end process;

  clocking: process
  begin
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
  end process;

end;
