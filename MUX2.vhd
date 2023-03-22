library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           A : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX2;

architecture Behavioral of MUX2 is

begin

Y <= I1 when a = '1' else I0;

end Behavioral;
