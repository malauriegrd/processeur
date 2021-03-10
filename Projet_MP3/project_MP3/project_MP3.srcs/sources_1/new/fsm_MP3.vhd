----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 14:54:54
-- Design Name: 
-- Module Name: fsm_MP3 - Behavioral
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

entity fsm_MP3 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           B_up : in STD_LOGIC;
           B_down : in STD_LOGIC;
           B_center : in STD_LOGIC;
           B_left : in STD_LOGIC;
           B_right : in STD_LOGIC;
           Play_pause : out STD_LOGIC;
           restart : out STD_LOGIC;
           Forward : out STD_LOGIC;
           Volume_up : out STD_LOGIC;
           Volume_dw : out STD_LOGIC);
end fsm_MP3;

architecture Behavioral of fsm_MP3 is
type etat is (init,play_fwd, pause, play_bwd, stop);
signal state : etat := init;
begin

    process(clock, reset)
        begin 
            if(reset ='0') then 
                Play_pause <='0';
                restart <= '0';
                Forward <= '0';
                Volume_up <= '0';
                Volume_dw <= '0';
                state <= init; 
            elsif(clock' event and clock = '1') then 
                case state is 
                    when init => 
                        Play_pause <='0';
                        restart <= '1';
                        Forward <= '0';
                        Volume_up <= '0';
                        Volume_dw <= '0';
                        if(B_center = '1') then 
                            state <= play_fwd;
                        end if; 
                    when play_fwd => 
                    
                        Play_pause <='1';
                        restart <= '0';
                        Forward <= '1';
                        Volume_up <= B_up;
                        Volume_dw <= B_down;
                                                
                        if(B_center ='1') then 
                            state <= pause; 
                        end if;
                        
                    when pause => 
                    
                        Play_pause <='0';
                        restart <= '0';
                        Forward <= '0';
                        Volume_up <= '0';
                        Volume_dw <= '0';
                        
                        if(B_center = '1' ) then 
                            state <= stop;
                        elsif(B_left = '1') then 
                            state <= play_bwd;
                        elsif(B_right = '1') then 
                            state <= play_fwd;
                        end if; 
                    when play_bwd => 
                    
                        Play_pause <='1';
                        restart <= '0';
                        Forward <= '0';
                        Volume_up <= B_up;
                        Volume_dw <= B_down;
                        
                        if(B_center = '1') then 
                            state <= pause; 
                        end if; 
                    when stop => 
                    
                        Play_pause <='0';
                        restart <= '1';
                        Forward <= '0';
                        Volume_up <= '0';
                        Volume_dw <= '0';
                        
                        if(B_center = '1') then 
                            state <= play_fwd;
                        end if;   
                end case; 
            end if;     
    end process;
end Behavioral;
