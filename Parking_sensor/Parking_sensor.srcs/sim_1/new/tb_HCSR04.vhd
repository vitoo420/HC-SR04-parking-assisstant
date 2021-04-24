----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2021 18:16:52
-- Design Name: 
-- Module Name: tb_sonar - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_sonar is
--  Port ( );
end tb_sonar;

architecture Behavioral of tb_sonar is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_clk : std_logic;
    signal s_trig : std_logic;
    signal s_echo : std_logic := '0';
    signal s_cm1 : unsigned(3 downto 0);
    signal s_cm0 : unsigned(3 downto 0);
begin

    uut_ce : entity work.sonar
        port map(
        clk => s_clk,
        trig => s_trig,
        echo => s_echo,
        cm1 => s_cm1,
        cm0 => s_cm0
        );

    p_clk_gen : process
    begin
     while now < 10000 ns loop   -- 10 usec of simulation
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
     wait;   
    end process p_clk_gen; 
    
end Behavioral;