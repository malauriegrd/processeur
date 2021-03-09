----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 13:37:19
-- Design Name: 
-- Module Name: tb_fsm_MP3 - Behavioral
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

entity fsm_MP3_tb is
end;

architecture bench of fsm_MP3_tb is

  component fsm_MP3
      Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;
             B_up : in STD_LOGIC;
             B_down : in STD_LOGIC;
             B_center : in STD_LOGIC;
             B_left : in STD_LOGIC;
             B_right : in STD_LOGIC;
             Play_pause : out STD_LOGIC;
             restart : out STD_LOGIC;
             Forward : out STD_LOGIC;
             Volume_up : out STD_LOGIC;
             Volume_dw : out STD_LOGIC);
  end component;

  signal clock: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal B_up: STD_LOGIC;
  signal B_down: STD_LOGIC;
  signal B_center: STD_LOGIC;
  signal B_left: STD_LOGIC;
  signal B_right: STD_LOGIC;
  signal Play_pause: STD_LOGIC;
  signal restart: STD_LOGIC;
  signal Forward: STD_LOGIC;
  signal Volume_up: STD_LOGIC;
  signal Volume_dw: STD_LOGIC;

  constant clock_period: time := 10 ns;

begin

  uut: fsm_MP3 port map ( clock      => clock,
                          reset      => reset,
                          B_up       => B_up,
                          B_down     => B_down,
                          B_center   => B_center,
                          B_left     => B_left,
                          B_right    => B_right,
                          Play_pause => Play_pause,
                          restart    => restart,
                          Forward    => Forward,
                          Volume_up  => Volume_up,
                          Volume_dw  => Volume_dw );
            
  reset <= '1', '0' after 10ns;  
  stimulus: process
  begin
  
    -- Put initialisation code here



    -- Put test bench stimulus code here
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns ; 
        
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns ;
        
        B_left <= '0'; 
        wait for 10ns; 
        B_left <= '1'; 
        wait for 10ns ;
        B_left <= '0'; 
        wait for 10ns; 
        
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns; 
        
        B_right <= '0'; 
        wait for 10ns; 
        B_right <= '1'; 
        wait for 10ns ;
        B_right <= '0';  
        wait for 10ns; 

        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0';  
        wait for 10ns; 
        
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0';  
        wait for 10ns;
        
 
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns;
        
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns;
        
        B_center <= '0'; 
        wait for 10ns; 
        B_center <= '1'; 
        wait for 10ns ;
        B_center <= '0'; 
        wait for 10ns;
        
  end process;

  clocking: process
  begin

      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;

  end process;

end;
  
