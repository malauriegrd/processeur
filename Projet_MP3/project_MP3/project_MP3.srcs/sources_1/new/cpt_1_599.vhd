----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 17:15:57
-- Design Name: 
-- Module Name: cpt_1_599 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpt_1_599 is
    Port ( forward : in STD_LOGIC;
           restart : in STD_LOGIC;
           play_pause : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           CE_aff : in STD_LOGIC;
           timer : out STD_LOGIC_VECTOR (9 downto 0));
end cpt_1_599;

architecture Behavioral of cpt_1_599 is

signal sig_time : std_logic_vector (9 downto 0);

begin
 process(reset, clock)
    begin 
        if (reset = '0') then
            sig_time <= "0000000000";
        elsif (clock' event and clock = '1') then 
            if(CE_aff ='1') then 
                if (play_pause = '1') then
                    if (forward = '1') then
                        if (sig_time < "1001010111") then
                            sig_time <= sig_time + 1;
                        end if;
                    elsif (forward = '0') then
                        if (sig_time > "0000000001") then
                            sig_time <= sig_time - 1;
                        end if;
                    end if;
                elsif(play_pause = '0') then 
                    if (restart = '1') then
                        sig_time <= "0000000001";
                    end if;    
                end if;
            end if;
        end if;
    end process;
    timer <= sig_time;

end Behavioral;
