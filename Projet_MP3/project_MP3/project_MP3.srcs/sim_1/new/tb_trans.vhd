-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_trans is
end;

architecture bench of tb_trans is

  component Trans
      Port ( forward : in STD_LOGIC;
             play_pause : in STD_LOGIC;
             restart : in STD_LOGIC;
             cpt_1_9 : in STD_LOGIC_VECTOR (3 downto 0);
             cpt_1_599 : in STD_LOGIC_VECTOR (9 downto 0);
             aff_unit : out STD_LOGIC_VECTOR (7 downto 0);
             aff_diz : out STD_LOGIC_VECTOR (7 downto 0);
             aff_cent : out STD_LOGIC_VECTOR (7 downto 0);
             aff_volume : out STD_LOGIC_VECTOR (7 downto 0);
             aff_etat_1 : out STD_LOGIC_VECTOR (7 downto 0);
             aff_etat_2 : out STD_LOGIC_VECTOR (7 downto 0);
             aff_etat_3 : out STD_LOGIC_VECTOR (7 downto 0);
             aff_etat_4 : out STD_LOGIC_VECTOR (7 downto 0)
             );
  end component;

  signal forward: STD_LOGIC;
  signal play_pause: STD_LOGIC;
  signal restart: STD_LOGIC;
  signal cpt_1_9: STD_LOGIC_VECTOR (3 downto 0);
  signal cpt_1_599: STD_LOGIC_VECTOR (9 downto 0);
  signal aff_unit: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_diz: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_cent: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_volume: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat_1: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat_2: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat_3: STD_LOGIC_VECTOR (7 downto 0);
  signal aff_etat_4: STD_LOGIC_VECTOR (7 downto 0) ;

begin

  uut: Trans port map ( forward    => forward,
                        play_pause => play_pause,
                        restart    => restart,
                        cpt_1_9    => cpt_1_9,
                        cpt_1_599  => cpt_1_599,
                        aff_unit   => aff_unit,
                        aff_diz    => aff_diz,
                        aff_cent   => aff_cent,
                        aff_volume => aff_volume,
                        aff_etat_1 => aff_etat_1,
                        aff_etat_2 => aff_etat_2,
                        aff_etat_3 => aff_etat_3,
                        aff_etat_4 => aff_etat_4 );

  stimulus: process
  begin
  
    forward    <= '1';
    play_pause <= '1';
    restart    <= '0';
    cpt_1_9    <= "0010";
    cpt_1_599  <= "0101110101";
    wait for 60 ns;

    forward    <= '0';
    play_pause <= '1';
    restart    <= '0';
    cpt_1_9    <= "0111";
    cpt_1_599  <= "1000110001";
    wait for 60 ns;
    
    forward    <= '0';
    play_pause <= '0';
    restart    <= '0';
    cpt_1_9    <= "0011";
    cpt_1_599  <= "0001001111";
    wait for 60 ns;
    
    forward    <= '0';
    play_pause <= '0';
    restart    <= '1';
    cpt_1_9    <= "0010";
    cpt_1_599  <= "0100001110";
    wait for 60 ns;

    wait;
  end process;


end;
