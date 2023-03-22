library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           i2 : in STD_LOGIC;
           i3 : in STD_LOGIC;
           a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           y : out STD_LOGIC);
end MUX4;

architecture Behavioral of MUX4 is

signal a : std_logic_vector(1 downto 0);

begin

 a <= a1 & a0;
 
 with a select
   y <= i0 when "00",
        i1 when "01",
        i2 when "10",
        i3 when "11",
        i0 when others;

end Behavioral;
