----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 14:24:05
-- Design Name: 
-- Module Name: tb_mux8 - Behavioral
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

entity mux8_tb is
end;

architecture bench of mux8_tb is

  component mux8
      Port ( commande : in STD_LOGIC_VECTOR (2 downto 0);
             aff_unit : in STD_LOGIC_VECTOR (7 downto 0);
             aff_diz : in STD_LOGIC_VECTOR (7 downto 0);
             aff_cent : in STD_LOGIC_VECTOR (7 downto 0);
             aff_volume : in STD_LOGIC_VECTOR (7 downto 0);
             aff_etat1 : in STD_LOGIC_VECTOR (7 downto 0);
             aff_etat2 : in STD_LOGIC_VECTOR (7 downto 0);
             aff_etat3 : in STD_LOGIC_VECTOR (7 downto 0);
             aff_etat4 : in STD_LOGIC_VECTOR (7 downto 0);
             cp : out STD_LOGIC;
             sept_seg : out STD_LOGIC_VECTOR (6 downto 0));
  end component;

  signal commande: STD_LOGIC_VECTOR (2 downto 0);
  signal aff_unit: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_diz: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_cent: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_volume: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat1: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat2: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat3: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat4: STD_LOGIC_VECTOR (7 downto 0);
  signal cp: STD_LOGIC;
  signal sept_seg: STD_LOGIC_VECTOR (6 downto 0);

begin

  uut: mux8 port map ( commande   => commande,
                       aff_unit   => aff_unit,
                       aff_diz    => aff_diz,
                       aff_cent   => aff_cent,
                       aff_volume => aff_volume,
                       aff_etat1  => aff_etat1,
                       aff_etat2  => aff_etat2,
                       aff_etat3  => aff_etat3,
                       aff_etat4  => aff_etat4,
                       cp         => cp,
                       sept_seg   => sept_seg );

  stimulus: process
  begin
  
    -- Put initialisation code here
    commande    <= "000" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "001" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "010" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "011" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "100" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "101" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "110" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;
    
    commande    <= "111" ; 
    aff_unit    <= "11000000";
    aff_diz     <= "10010010";
    aff_cent    <= "10110000";
    aff_volume  <= "00000010";
    aff_etat1   <= "11110000";
    aff_etat2   <= "10111111";
    aff_etat3   <= "10111111";
    aff_etat4   <= "10111111";
    wait for 20ns;                 
    -- Put test bench stimulus code here

    wait;
  end process;


end;
  