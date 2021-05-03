library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sonar is
    Port ( clk        : in STD_LOGIC;
           trig       : out STD_LOGIC;    --trigger
           echo       : in STD_LOGIC := '0';
           cm_units_o : out unsigned(3 downto 0); --cm1
           cm_tens_o  : out unsigned(3 downto 0)  --cm0
           ); 
end sonar;
architecture Behavioral of sonar is
    signal count       : integer range 0 to 10000;
    signal tmpcm_units : unsigned(3 downto 0) := "0000";
    signal tmpcm_tens  : unsigned(3 downto 0) := "0000";
    signal sendTrig    : std_logic := '1';
    signal echoPrev    : std_logic:= '0';
    signal echoCurrent : std_logic:= '0';
    begin
    process(clk)
    begin
        if rising_edge(clk) then
            if sendTrig = '1' then -- send 10us trig
                if count = 10 then -- 10 us trig is completed, reset tmp signals for the new calculation
                    trig <= '0';
                    sendTrig <= '0';
                    count <= 0;
                    tmpcm_units <= "0000";
                    tmpcm_tens <= "0000";
                else
                    trig <= '1';
                    count <= count + 1;
                end if; 
            else -- stop sending trig, do the calculation (10 clk cycle = 1cm)
                if echo = '1' then -- start counting
                    if count = 10 then --10 measuered 1 cm
                        if tmpcm_tens = "1001" then
                           if tmpcm_units = "1001" then
                                sendTrig <= '1';--max distance to be measured(cca 300 cm)g
                                cm_tens_o <= tmpcm_tens;
                                cm_units_o <= tmpcm_units;
                            else
                                tmpcm_units <= tmpcm_units + "0001";
                                tmpcm_tens <= "0000";
                            end if;
                        else
                            tmpcm_tens <= tmpcm_tens + "0001";
                        end if;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;
                    if echoPrev = '1' and echoCurrent = '0' then --falling edge of echo
                        sendTrig <= '1';
                        cm_tens_o <= tmpcm_tens;
                        cm_units_o <= tmpcm_units;
                    end if;                              
                end if;                        
            end if;
            echoPrev <= echoCurrent;
            echoCurrent <= echo;
        end if;      
    end process; 
end Behavioral;