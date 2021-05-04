library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations
use ieee.numeric_std.all;   -- Package for arithmetic operations

entity sensor is
port(
    CLK     : in std_logic;     --clock
    reset   : in std_logic;
    echo    : in std_logic;    
    trig    : out std_logic; 
    b_spacing : out std_logic_vector(9 - 1 downto 0) := "000000000"
        
    );  
end entity sensor;

architecture Behavioral of sensor is 

    signal s_tick_trig  : unsigned(6 - 1 downto 0) := "000000";
    signal s_tick_echo  : unsigned(6 - 1 downto 0) := "000000";
    
begin

    p_trig : process(clk)
        begin
            if rising_edge(clk) then
                s_tick_trig <= s_tick_trig + 1;
                if (reset = '1') then              -- reset 1, trigger 0           
                    trig <= '0';    
                end if;
                
                if(s_tick_trig < "001011") then
                    trig <= '1';
                elsif(s_tick_trig < "011110" and s_tick_trig > "001010") then
                    trig <= '0';
                else
                    s_tick_trig <= "000000";
                end if;
            end if;
    end process p_trig;
    

    p_spacing : process(clk, echo)
    begin
    if rising_edge(clk) then
            if reset = '1' then
               b_spacing <= "000000000"; 
               s_tick_echo <= "000000";
            end if;
            if(echo = '1') then
                s_tick_echo <= s_tick_echo +1;                
            end if;
    end if;
    
    if falling_edge(echo) then
        b_spacing <= std_logic_vector(s_tick_echo * "111");
    end if;
    
    end process p_spacing;
end architecture Behavioral;