----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2021 08:52:14
-- Design Name: 
-- Module Name: registre - Behavioral
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

entity registre is
    Port ( registre_in : in STD_LOGIC;
           rst : in std_logic;
           clk : in STD_LOGIC;
           registre_out : out STD_LOGIC);
end registre;

architecture Behavioral of registre is

begin
    Process(clk)
    begin
        if (rst='1') then
            registre_out <= '0';
        elsif (clk'event and clk='1') then
                registre_out <= registre_in;
        end if;
     end process;

end Behavioral;
