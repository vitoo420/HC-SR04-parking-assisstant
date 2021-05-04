----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2021 19:02:01
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

           signal s_CLK100MHZ :  STD_LOGIC;                       
           signal s_BTNC      :  STD_LOGIC;                       
           signal s_ja        :  STD_LOGIC;
           signal s_jc        :  STD_LOGIC;
           signal s_jd        :  STD_LOGIC_VECTOR  (9-1 downto 0);

begin

    uut_top : entity work.top
        port map(
            CLK100MHZ  => s_CLK100MHZ,
            BTNC       => s_BTNC,
            ja         => s_ja,
            jc         => s_jc,
            jd         => s_jd
        );

p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_BTNC <= '1';
        s_ja   <= '0';
        wait for 50 ms;
        s_BTNC <= '0';
        wait for 50 ms;
        s_BTNC <= '1';
        wait for 80 ms;
        s_BTNC <= '0';
        wait for 50 ms;
        s_BTNC <= '1';
        wait for 40 ms;
        s_BTNC <= '0';
        wait for 50 ms;
        s_BTNC <= '1';
        wait for 90 ms;
        
        -- Report a note at the end of stimulus process
        report "Hotovo" severity note;
        wait;
    end process p_stimulus;
        
end Behavioral;