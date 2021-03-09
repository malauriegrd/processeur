----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 14:52:47
-- Design Name: 
-- Module Name: Trans - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Trans is
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
           
end Trans;

architecture Behavioral of Trans is

signal sig_cpt_cent : std_logic_vector(9 downto 0);
signal sig_cpt_diz : std_logic_vector(9 downto 0);

begin
    etat : process (restart, forward, play_pause)
    begin
        if (restart = '1') then
            aff_etat_1 <= "10110000";
            aff_etat_2 <= "10111111";
            aff_etat_3 <= "10111111";
            aff_etat_4 <= "10000110";
        else
            if (play_pause = '1') then
                if (forward = '1') then
                    aff_etat_1 <= "10111111";
                    aff_etat_2 <= "10111111";
                    aff_etat_3 <= "10111111";
                    aff_etat_4 <= "10110000";
                else
                    aff_etat_1 <= "10000110";
                    aff_etat_2 <= "10111111";
                    aff_etat_3 <= "10111111";
                    aff_etat_4 <= "10111111";
                end if;
            else 
                if (forward = '0') then
                    aff_etat_1 <= "10111111";
                    aff_etat_2 <= "10111111";
                    aff_etat_3 <= "10111111";
                    aff_etat_4 <= "10111111";
                end if;
            end if;
        end if;
    end process;


    volume : process(cpt_1_9)
    begin
        case cpt_1_9 is
            when "0001" =>
                aff_volume <= "01111001";
            when "0010" =>
                aff_volume <= "00100100";
            when "0011" =>
                aff_volume <= "00110000";
            when "0100" =>
                aff_volume <= "00011011";
            when "0101" =>
                aff_volume <= "00010010";
            when "0110" =>
                aff_volume <= "00000010";
            when "0111" =>
                aff_volume <= "01111000";
            when "1000" =>
                aff_volume <= "00000000";
            when "1001" =>
                aff_volume <= "00010000";
            when others =>
                aff_volume <= "01000000";
        end case;
    end process;
    
    
    
    centaine : process(cpt_1_599)
    begin 
        if cpt_1_599 < std_logic_vector(to_unsigned(100,10)) then
            aff_cent <= "11000000";
            sig_cpt_cent <= cpt_1_599;
        elsif cpt_1_599 < std_logic_vector(to_unsigned(200,10)) then
            aff_cent <= "11111001";
            sig_cpt_cent <= cpt_1_599 - std_logic_vector(to_unsigned(100, 10));
        elsif cpt_1_599 < std_logic_vector(to_unsigned(300,10)) then
            aff_cent <= "10100100";
            sig_cpt_cent <= cpt_1_599 - std_logic_vector(to_unsigned(200, 10));
        elsif cpt_1_599 < std_logic_vector(to_unsigned(400,10)) then
            aff_cent <= "10110000";
            sig_cpt_cent <= cpt_1_599 - std_logic_vector(to_unsigned(300, 10));
        elsif cpt_1_599 < std_logic_vector(to_unsigned(500,10)) then
            aff_cent <= "10011001";
            sig_cpt_cent <= cpt_1_599 - std_logic_vector(to_unsigned(400, 10));  
        elsif cpt_1_599 < std_logic_vector(to_unsigned(600,10)) then
            aff_cent <= "10010010";
            sig_cpt_cent <= cpt_1_599 - std_logic_vector(to_unsigned(500, 10)); 
        else
            aff_cent <= "11000000";           
        end if;  
     end process;


     dizaine : process(sig_cpt_cent)
     begin
        if sig_cpt_cent < std_logic_vector(to_unsigned(10,10)) then
            aff_diz <= "11000000";
            sig_cpt_diz <= sig_cpt_cent;
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(20,10)) then
            aff_diz <= "11111001";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(10, 10));
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(30,10)) then
            aff_diz <= "10100100";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(20, 10));
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(40,10)) then
            aff_diz <= "10110000";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(30, 10));
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(50,10)) then
            aff_diz <= "10011001";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(40, 10));  
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(60,10)) then
            aff_diz <= "10010010";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(50, 10)); 
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(70,10)) then
            aff_diz <= "10000010";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(60, 10));  
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(80,10)) then
            aff_diz <= "11111000";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(70, 10));  
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(90,10)) then
            aff_diz <= "10000000";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(80, 10)); 
        elsif sig_cpt_cent < std_logic_vector(to_unsigned(100,10)) then
            aff_diz <= "10010000";
            sig_cpt_diz <= sig_cpt_cent - std_logic_vector(to_unsigned(90, 10));    
        else
            aff_diz <= "11000000";      
        end if;  
     end process; 
     
     
     unite : process(sig_cpt_diz)
     begin
        if sig_cpt_diz < std_logic_vector(to_unsigned(1,10)) then
            aff_unit <= "11000000";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(2,10)) then
            aff_unit <= "11111001";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(3,10)) then
            aff_unit <= "10100100";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(4,10)) then
            aff_unit <= "10110000";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(5,10)) then
            aff_unit <= "10011001";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(6,10)) then
            aff_unit <= "10010010"; 
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(7,10)) then
            aff_unit <= "10000010"; 
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(8,10)) then
            aff_unit <= "11111000";  
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(9,10)) then
            aff_unit <= "10000000";
        elsif sig_cpt_diz < std_logic_vector(to_unsigned(10,10)) then
            aff_unit <= "10010000"; 
        else
            aff_unit <= "11000000";       
        end if;  
     end process; 
        
        
end Behavioral;
