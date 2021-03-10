----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 15:55:13
-- Design Name: 
-- Module Name: mod8 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod8 is
    Port ( CE_perc : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           commande : out STD_LOGIC_VECTOR (2 downto 0));
end mod8;

architecture Behavioral of mod8 is
signal compteur : unsigned(2 downto 0); 

begin
    
    process(clock, reset)
        begin
            if(reset ='0') then 
                compteur <= "000"; 
            elsif(clock' event and clock= '1') then 
                if(CE_perc ='1') then 
                    if(compteur < "111") then 
                        compteur <= compteur +1;
                    else 
                        compteur <= "000"; 
                    end if;
                end if; 
            end if;     
    end process; 
    
    commande <= STD_LOGIC_VECTOR (compteur);
    
    process(compteur)
        begin 
            case compteur is 
                when "000" => 
                    AN <= "11111110";
                when "001" =>
                    AN <= "11111101";
                when "010" =>
                    AN <= "11111011";
                when "011" => 
                    AN <= "11110111";
                when "100" =>
                    AN <= "11101111";
                when "101" => 
                    AN <= "11011111";
                when "110" => 
                    AN <= "10111111";
                when "111" => 
                    AN <= "01111111";
                when others =>
                    AN <= "11111111";
            end case;     
    end process;
end Behavioral;
