----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 15:23:12
-- Design Name: 
-- Module Name: gestion_freq - Behavioral
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

entity gestion_freq is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           CE_aff : out STD_LOGIC;
           CE_perc : out STD_LOGIC);
end gestion_freq;

architecture Behavioral of gestion_freq is
signal compt_perc : std_logic_vector (18 downto 0);
signal compt_aff : std_logic_vector (23 downto 0);

begin
   P1: process (clock,reset)
		begin
		  if reset = '1' then 
		      compt_perc <= (others => '0');
		      compt_aff <= (others => '0');
		  elsif clock = '1' and clock'event then
		      if (compt_perc > std_logic_vector(TO_UNSIGNED(333332, 32))) then 
		          compt_perc <= (others => '0');
		      else 
                compt_perc <= compt_perc + 1;
              end if;
              if (compt_aff > std_logic_vector(TO_UNSIGNED(9999999, 32))) then
                compt_aff <= (others => '0');
                end if;
		  end if;
   end process;

   P2: process (compt_perc, compt_aff)
		begin
		  if (compt_perc = std_logic_vector(TO_UNSIGNED(333332, 32))) then 
		      CE_perc <='1';
		  else 
		      CE_perc <='0';
          end if;
          
          if (compt_aff = std_logic_vector(TO_UNSIGNED(9999999, 32))) then 
		      CE_aff <='1';
		  else 
		      CE_aff <='0';
          end if;
          
       end process;
       
   
end Behavioral;
