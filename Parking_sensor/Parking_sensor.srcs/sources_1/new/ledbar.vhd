------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for traffic light controller
------------------------------------------------------------------------
entity ledbar is
    port(
        distance       :   in std_logic_vector(9 - 1 downto 0);
        signal_LEDbar  :   out std_logic_vector(8 - 1 downto 0)
    );
end entity ledbar;

------------------------------------------------------------------------
-- Architecture declaration for traffic light controller
------------------------------------------------------------------------
architecture Behavioral of ledbar is
    
    type t_state is (st_300,
                     st_250_300,
                     st_200_250,
                     st_150_200,
                     st_100_150,
                     st_50_100,
                     st_10_50,
                     st_10);
    -- Define the signal that uses different states
    signal s_state  : t_state;

begin

    --------------------------------------------------------------------
    -- p_output_state:
    -- Decides about actual state
    --------------------------------------------------------------------
    p_output_state : process(distance)
    begin              
        if(distance >  "100101100") then                                 --greater than 300
            s_state <= st_300;
        elsif(distance < "100101100" and distance > "011111010") then    --between 250 and 300
            s_state <= st_250_300;
        elsif(distance < "011111010" and distance > "011001000") then    --between 200 and 250
            s_state <= st_200_250;
        elsif(distance < "011001000" and distance > "010010110") then    --between 150 and 200
            s_state <= st_150_200;
        elsif(distance < "010010110" and distance > "001100100") then    --between 100 and 150
            s_state <= st_100_150;
        elsif(distance < "001100100" and distance > "000110010") then    --between 50 and 100
            s_state <= st_50_100;
        elsif(distance < "000110010" and distance > "000001010") then    --between 10 and 50                                                     
            s_state <= st_10_50;
        else                                                             --less than 50
            s_state <= st_10;
        end if;
    end process p_output_state;
    
    p_signal  :   process(s_state)
    begin  
            case s_state is
                when st_300 =>
                    signal_LEDbar <= "00000001"; 
                    
                when st_250_300 =>
                    signal_LEDbar <= "00000011"; 
 
                when st_200_250 =>
                    signal_LEDbar <= "00000111"; 
      
                when st_150_200 =>
                    signal_LEDbar <= "00001111"; 
     
                when st_100_150 =>
                    signal_LEDbar <= "00011111"; 
      
                when st_50_100  =>
                    signal_LEDbar <= "00111111"; 
      
                when st_10_50      =>
                    signal_LEDbar <= "01111111"; 

                when st_10  =>
                    signal_LEDbar <= "11111111";
                         
            end case;     
    end process p_signal;
end architecture Behavioral;
