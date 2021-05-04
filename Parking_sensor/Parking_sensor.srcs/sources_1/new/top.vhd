library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  Port ( 
           CLK100MHZ : in STD_LOGIC;  
           BTNC      : in STD_LOGIC;   
           ja        : in STD_LOGIC;    
           jc        : out STD_LOGIC;   
           jd        : out STD_LOGIC_VECTOR (9-1 downto 0)             
  );
end top;

architecture Behavioral of top is

signal s_distance : std_logic_vector(9 - 1 downto 0);
signal s_clk : std_logic;

begin
ledbar : entity work.ledbar
        port map(
            distance => s_distance,
            signal_LEDbar(7) => jd(7),
            signal_LEDbar(6) => jd(6), 
            signal_LEDbar(5) => jd(5),
            signal_LEDbar(4) => jd(4),
            signal_LEDbar(3) => jd(3),
            signal_LEDbar(2) => jd(2),
            signal_LEDbar(1) => jd(1),
            signal_LEDbar(0) => jd(0)
        );
        
speaker : entity work.speaker
        port map(
            distance    => s_distance,
            beep_switch => jc,
            clk         => CLK100MHZ
        );
        
sensor : entity work.sensor
        port map(
            CLK        => CLK100MHZ,
            reset      => BTNC,
            echo       => ja,
            trig       => jc,
            b_spacing  => s_distance              
        );
end Behavioral;

