----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 14:05:20
-- Design Name: 
-- Module Name: mux8 - Behavioral
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

entity mux8 is
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
end mux8;

architecture Behavioral of mux8 is

begin
    process (commande)
        begin 
            if(commande = "000") then 
                cp <=aff_etat1(7);
                sept_seg <= aff_etat1(6 downto 0);
            elsif(commande = "001") then 
                cp <=aff_etat2(7);
                sept_seg <= aff_etat2(6 downto 0);
            elsif(commande = "010") then 
                cp <= aff_etat3(7);
                sept_seg <= aff_etat3(6 downto 0);
            elsif(commande = "011") then 
                cp <= aff_etat4(7);
                sept_seg <= aff_etat4(6 downto 0);
            elsif(commande = "100") then 
                cp <= aff_volume(7);
                sept_seg <= aff_volume(6 downto 0) ; 
            elsif (commande = "101") then 
                cp <= aff_cent(7);
                sept_seg <= aff_cent(6 downto 0); 
            elsif (commande = "110") then 
                cp <= aff_diz(7);
                sept_seg <= aff_diz(6 downto 0);
            elsif (commande = "111") then 
                cp <= aff_unit(7);
                sept_seg <= aff_unit(6 downto 0);
            end if;    
    end process; 

end Behavioral;
