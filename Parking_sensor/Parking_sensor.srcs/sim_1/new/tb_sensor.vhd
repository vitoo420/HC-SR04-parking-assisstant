----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2021 19:25:03
-- Design Name: 
-- Module Name: tb_sensor - Behavioral
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

entity tb_sensor is
--  Port ( );
end tb_sensor;
architecture Behavioral of tb_sensor is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    signal reset   : std_logic;
    signal echo    : std_logic;    
    signal trig    : std_logic
begin

uut_ce : entity work.sensor
   port map(
        clk => s_clk,
        trig => s_trig,
        echo => s_echo,
        cm_units_o => s_cm_units_o,
        cm_tens_o => s_cm_tens_o
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
    
    p_echo : process
    begin
    wait for 120 ns;
    s_echo <= '1';
    wait for 158 ns;
    s_echo <= '0';
    end process p_echo; 
    
        p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
