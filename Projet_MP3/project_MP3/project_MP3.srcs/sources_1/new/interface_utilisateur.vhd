----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 16:23:41
-- Design Name: 
-- Module Name: interface_utilisateur - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interface_utilisateur is
    Port ( Horloge : in STD_LOGIC;
           Raz : in STD_LOGIC;
           Bouton_haut : in STD_LOGIC;
           Bouton_bas : in STD_LOGIC;
           Bouton_gauche : in STD_LOGIC;
           Bouton_droite : in STD_LOGIC;
           Bouton_centre : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           Sept_Segments : out STD_LOGIC_VECTOR (6 downto 0);
           DP : out STD_LOGIC);
end interface_utilisateur;

architecture Behavioral of interface_utilisateur is
signal output_b_center : std_logic;
signal output_b_down : std_logic;
signal output_b_up : std_logic;
signal output_b_left : std_logic;
signal output_b_right : std_logic;
signal play_pause : std_logic;
signal forward : std_logic;
signal restart : std_logic;
signal volume_dw : std_logic;
signal volume_up : std_logic;
signal CE_aff : std_logic;
signal CE_perc : std_logic;
signal volume : std_logic_vector(3 downto 0);
signal timer : std_logic_vector(9 downto 0);
signal aff_unit : STD_LOGIC_VECTOR (7 downto 0);
signal aff_diz : STD_LOGIC_VECTOR (7 downto 0);
signal aff_cent : STD_LOGIC_VECTOR (7 downto 0);
signal aff_volume : STD_LOGIC_VECTOR (7 downto 0);
signal aff_etat_1 : STD_LOGIC_VECTOR (7 downto 0);
signal aff_etat_2 : STD_LOGIC_VECTOR (7 downto 0);
signal aff_etat_3 : STD_LOGIC_VECTOR (7 downto 0);
signal aff_etat_4 : STD_LOGIC_VECTOR (7 downto 0);
signal anode : STD_LOGIC_VECTOR (7 downto 0);
signal commande : STD_LOGIC_VECTOR (2 downto 0);

begin

reg_b_center : entity work.registre 
port map (  registre_in => Bouton_centre,
           rst => Raz,
           clk => Horloge,
           registre_out => output_b_center);
           
reg_b_down : entity work.registre            
port map (  registre_in => Bouton_bas,
           rst => Raz,
           clk => Horloge,
           registre_out => output_b_down);
           
reg_b_left : entity work.registre            
port map (  registre_in => Bouton_gauche,
           rst => Raz,
           clk => Horloge,
           registre_out => output_b_left); 
           
reg_b_right : entity work.registre            
port map (  registre_in => Bouton_droite,
           rst => Raz,
           clk => Horloge,
           registre_out => output_b_right);   

reg_b_up : entity work.registre            
port map (  registre_in => Bouton_haut,
           rst => Raz,
           clk => Horloge,
           registre_out => output_b_up);  
           
FSM : entity work.fsm_MP3            
port map (  clock => Horloge,
           reset => Raz,
           B_up => output_b_up,
           B_down => output_b_down,
           B_center => output_b_center,
           B_left => output_b_left,
           B_right => output_b_right,
           Play_pause => play_pause,
           restart => restart,
           Forward => forward,
           Volume_up => volume_up,
           Volume_dw => volume_dw);
          
gestion_freq : entity work.gestion_freq
port map ( clock => Horloge,
           reset => Raz,
           CE_aff => CE_aff,
           CE_perc => CE_perc);

cpt_1_9 : entity work.cpt_1_9
port map ( volume_up => volume_up,
           volume_down => volume_dw,
           clock => Horloge,
           reset => Raz,
           volume => volume);
           
cpt_1_599 : entity work.cpt_1_599
port map ( forward => forward,
           restart => restart,
           play_pause => play_pause,
           reset => Raz,
           clock => Horloge,
           CE_aff => CE_aff,
           timer => timer);
        
trans : entity work.Trans
port map ( forward => forward,
           play_pause => play_pause,
           restart => restart,
           cpt_1_9 => volume,
           cpt_1_599 => timer,
           
           aff_unit => aff_unit,
           aff_diz => aff_diz,
           aff_cent => aff_cent,
           aff_volume => aff_volume,
           aff_etat_1 => aff_etat_1,
           aff_etat_2 => aff_etat_2,
           aff_etat_3 => aff_etat_3,
           aff_etat_4 => aff_etat_4);
           
mod8 : entity work.mod8
port map ( CE_perc => CE_perc,
           clock => Horloge,
           reset => Raz,
           AN => anode,
           commande => commande);
           
mux8 : entity work.mux8
port map ( commande => commande,
           aff_unit => aff_unit,
           aff_diz => aff_diz,
           aff_cent => aff_cent,
           aff_volume => aff_volume,
           aff_etat1 => aff_etat_1,
           aff_etat2 => aff_etat_2,
           aff_etat3 => aff_etat_3,
           aff_etat4 => aff_etat_4,
           cp => DP,
           sept_seg => Sept_Segments);          

end Behavioral;
