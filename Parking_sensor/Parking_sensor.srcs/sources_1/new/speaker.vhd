------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for traffic light controller
------------------------------------------------------------------------
entity speaker is
    port(
        clk         :   in std_logic;
        distance    :   in std_logic_vector(9-1 downto 0);
        beep_switch :   out std_logic
    );
end entity speaker;

------------------------------------------------------------------------
-- Architecture declaration for traffic light controller
------------------------------------------------------------------------
architecture Behavioral of speaker is

    -- Internal clock enable
    signal s_en     : std_logic;
    -- Local delay counter
    signal   s_cnt  : unsigned(4 - 1 downto 0);
    
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

    -- Specific values for local counter
    constant c_DELAY_06SEC : unsigned(4 - 1 downto 0) := b"0110";
    constant c_DELAY_05SEC : unsigned(4 - 1 downto 0) := b"0101";
    constant c_DELAY_04SEC : unsigned(4 - 1 downto 0) := b"0100";
    constant c_DELAY_03SEC : unsigned(4 - 1 downto 0) := b"0011";
    constant c_DELAY_02SEC : unsigned(4 - 1 downto 0) := b"0010";
    constant c_DELAY_01SEC : unsigned(4 - 1 downto 0) := b"0001";
    constant c_ZERO        : unsigned(4 - 1 downto 0) := b"0000";
    
    
    
    
    
    

begin

    --------------------------------------------------------------------
    -- p_output_state:
    -- Decides about actual state
    --------------------------------------------------------------------
    p_output_state : process(distance)
    begin              
        if(distance >= "100101100") then                                --greater than 300
            s_state <= st_300;
        elsif(distance < "100101100" and distance >= "011111010") then   --between 250 and 300
            s_state <= st_250_300;
        elsif(distance < "011111010" and distance >= "011001000") then    --between 200 and 250
            s_state <= st_200_250;
        elsif(distance < "011001000" and distance >= "010010110") then    --between 150 and 200
            s_state <= st_150_200;
        elsif(distance < "010010110" and distance >= "001100100") then     --between 100 and 150
            s_state <= st_100_150;
        elsif(distance < "001100100" and distance >= "000110010") then       --between 50 and 100
            s_state <= st_50_100;
        elsif(distance < "000110010" and distance >= "000001010") then          --between 10 and 50                                                     --less than 50
            s_state <= st_10_50;
        else
            s_state <= st_10;
        end if;
    end process p_output_state;
    
    p_beep  :   process(clk)
    begin
        if (rising_edge(clk)) then
        
            case s_state is
                when st_300 =>
                    beep_switch <= '0';         
                when st_250_300 =>
                    if (s_cnt < c_DELAY_06SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_06SEC) and s_cnt < (2*c_DELAY_06SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if;      
                when st_200_250 =>
                    if (s_cnt < c_DELAY_05SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_05SEC) and s_cnt < (2*c_DELAY_05SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if;      
                when st_150_200 =>
                    if (s_cnt < c_DELAY_04SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_04SEC) and s_cnt < (2*c_DELAY_04SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if;      
                when st_100_150 =>
                    if (s_cnt < c_DELAY_03SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_03SEC) and s_cnt < (2*c_DELAY_03SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if;      
                when st_50_100  =>
                    if (s_cnt < c_DELAY_02SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_02SEC) and s_cnt < (2*c_DELAY_02SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if;      
                when st_10_50      =>
                    if (s_cnt < c_DELAY_01SEC) then
                        s_cnt <= s_cnt + 1;
                        beep_switch <= '1';
                    elsif((s_cnt >= c_DELAY_01SEC) and s_cnt < (2*c_DELAY_01SEC)) then
                         s_cnt <= s_cnt + 1;
                         beep_switch <= '0';  
                    else
                        s_cnt <= c_ZERO;
                    end if; 
                when st_10  =>
                    beep_switch <= '1';     
            end case;  
        end if;  
    end process p_beep;
end architecture Behavioral;
