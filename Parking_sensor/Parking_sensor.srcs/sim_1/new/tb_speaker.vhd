----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2021 06:36:15 PM
-- Design Name: 
-- Module Name: tb_speaker - testbench
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

entity tb_speaker is
    -- Entity of testbench is always empty  
end tb_speaker;

architecture testbench of tb_speaker is
    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_distance   : std_logic_vector(9-1 downto 0);
    signal s_beep_switch: std_logic;
begin

uut_tlc : entity work.speaker
        port map(
            clk         => s_clk_100MHz,
            distance    => s_distance,
            beep_switch => s_beep_switch
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
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

end testbench;
