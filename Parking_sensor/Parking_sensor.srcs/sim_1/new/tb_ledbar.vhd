----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2021 18:26:05
-- Design Name: 
-- Module Name: tb_ledbar - Behavioral
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

entity tb_ledbar is
--  Port ( );
end tb_ledbar;

architecture Behavioral of tb_ledbar is

    signal s_distance          : std_logic_vector(9 - 1 downto 0);
    signal s_signal_LEDbar     : std_logic_vector(8 - 1 downto 0);
    
begin

   uut_ledbar : entity work.ledbar
        port map(
            distance       => s_distance,
            signal_LEDbar  => s_signal_LEDbar       
        );
    
    p_stimulus : process
    begin
        s_distance <= "111111111";
        wait for 100 ns;
        s_distance <= "100001110";
        wait for 100 ns;
        s_distance <= "011011100";
        wait for 100 ns;
        s_distance <= "010101010";
        wait for 100 ns;
        s_distance <= "001111000";
        wait for 100 ns;
        s_distance <= "001000110";
        wait for 100 ns;
        s_distance <= "000010100";
        wait for 100 ns;
        s_distance <= "000000000";
        wait;
    end process p_stimulus;
          
end Behavioral;