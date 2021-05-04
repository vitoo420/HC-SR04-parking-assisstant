library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations
use ieee.numeric_std.all;   -- Package for arithmetic operations

entity sensor is
port(
    CLK     : in std_logic;     --clock
    reset   : in std_logic;
    echo    : in std_logic;    
    trig    : out std_logic; 
    b_spacing : out std_logic_vector(9 - 1 downto 0)
        
    );  
end entity sensor;

architecture Behavioral of sensor is 

    signal s_tick_trig  : integer := 0;
    signal s_tick_echo  : integer := 0;
    signal spacing      : integer := 0;
    
begin

--    p_trig : process(clk)
--    begin
--        if rising_edge(clk) then
--            s_tick <= s_tick + 1;
--            if reset = '1' then              -- reset 1, trigger 0           
--               trig <= '0'; 
--               --s_tick <= 0;   
--            end if;        
          
--          else
--            if (s_tick <= 10) then         -- trigger 1 (10us)                     
--                trig <= '1'; 
--          elsif (s_tick < 30 and s_tick > 10) then   --trigger 0 
--                 trig <= '0';
--          else 
--                 s_tick <= 0;                --reset 
--                end if; 
--       end if;
--    end process p_trig;

    p_trig : process(clk)
        begin
            if rising_edge(clk) then
                s_tick_trig <= s_tick_trig + 1;
                if (reset = '1') then              -- reset 1, trigger 0           
                    trig <= '0';    
                end if;
                
                if(s_tick_trig < 11) then
                    trig <= '1';
                elsif(s_tick_trig < 30 and s_tick_trig > 10) then
                    trig <= '0';
                else
                    s_tick_trig <= 0;
                end if;
            end if;
    end process p_trig;
    
--    p_spacing : process(clk, echo)
--    begin
--        if rising_edge(clk) then
--            if reset = '1' then
--               s_spacing <= 0; 
--               s_tick_echo <= 0;
--            end if;
--         else
--            if echo = '1' then      -- echo 1, start counting time
--               s_tick_echo <= s_tick_echo +1; 
--               s_spacing <= s_tick_echo /(100*58);
--            else
--               s_tick_echo <= 0;
--            end if;
--        end if;
--    end process p_spacing;
    p_spacing : process(clk, echo)
    begin
    if rising_edge(clk) then
            if reset = '1' then
               spacing <= 0; 
               s_tick_echo <= 0;
            end if;
            if(echo = '1') then
                s_tick_echo <= s_tick_echo +1;                
            end if;
    end if;
    
    if falling_edge(echo) then
                spacing <= s_tick_echo;
                b_spacing <= std_logic_vector(to_signed(spacing, 9));
            end if;
    end process p_spacing;
end architecture Behavioral;