----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 16:58:18
-- Design Name: 
-- Module Name: cpt_1_9 - Behavioral
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

entity cpt_1_9 is
    Port ( volume_up : in STD_LOGIC;
           volume_down : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           volume : out STD_LOGIC_VECTOR (3 downto 0));
end cpt_1_9;

architecture Behavioral of cpt_1_9 is

signal sig_volume : std_logic_vector(3 downto 0);

begin
    process(reset, clock)
    begin 
        if (reset = '0') then
            sig_volume <= "0101";
        elsif (clock' event and clock = '1') then 
            if (volume_up = '1') then
                if (sig_volume < "1001") then
                    sig_volume <= sig_volume + 1;
                end if;
            elsif(volume_down = '1') then
                if (sig_volume > "0001") then
                    sig_volume <= sig_volume - 1;
                end if;
            end if;
        end if;
    end process;
    volume <= sig_volume;
end Behavioral;
