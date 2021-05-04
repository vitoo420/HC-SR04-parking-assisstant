library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations
use ieee.numeric_std.all;   -- Package for arithmetic operations

entity sensor is
port(
    CLK     : in std_logic;     --clock
    reset   : in std_logic;
    echo    : in std_logic;    
    trig    : out std_logic     
    );  
end entity sensor;

architecture Behavioral of sensor is 

    signal s_tick     : integer; 
    signal s_spacing  : integer;
    
begin

    p_trig : process(clk)is
    begin
        if rising_edge(clk) then
            if reset = '1' then              -- reset 1, trigger 0           
               trig <= '0'; 
               --s_tick <= 0;   
            end if;        
          else
            if (s_tick <= 10) then         -- trigger 1 (10us)                     
                trig <= '1'; 
               --s_tick <= s_tick + 1;
          elsif (s_tick < 100 and s_tick > 10) then   --trigger 0
                -- s_tick <= s_tick + 1;
                 trig <= '0';
          else 
                 --s_tick <= 0;                --reset 
                end if; 
       end if;
    end process p_trig;
    
    p_spacing : process(clk, echo)is 
    begin
        if rising_edge(clk) then
            if reset = '1' then
               s_spacing <= 0; 
               s_tick <= 0;
            end if;
         else
            if echo = '1' then      -- echo 1, start counting time
               s_tick <= s_tick +1; 
               s_spacing <= s_tick /(100*58);
            else
               s_tick <= 0;
            end if;
        end if;
    end process p_spacing;
end architecture Behavioral;