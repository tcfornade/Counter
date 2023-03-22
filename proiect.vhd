library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity proiect is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end proiect;

architecture Behavioral of proiect is

component cnt is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           ld : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           cy : out STD_LOGIC);
end component cnt;

component MUX2 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           A : in STD_LOGIC;
           Y : out STD_LOGIC);
end component MUX2;

component MUX4 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           i2 : in STD_LOGIC;
           i3 : in STD_LOGIC;
           a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           y : out STD_LOGIC);
end component MUX4;

signal d, qint : std_logic_vector (3 downto 0);
signal en, ld : std_logic;
signal Q0_neg: std_logic;

begin

UUT: cnt port map ( d => d,
                 clk => clk,
                 ld => ld,
                 en => en,
                 rst => rst,
                 q => qint);
                 
Q0_neg <= not qint(0);

U1: MUX2 port map ( I0 => '1',
                    I1 => Q0_neg,
                    A => qint(2),
                    Y => ld);

U2: MUX4 port map (i0 => Q0_neg,
                   i1 => Q0_neg,
                   i2 => '0',
                   i3 => '0',
                   a0 => qint(1),
                   a1 => qint(2),
                   y => d(2));

              
U3: MUX2 port map ( I0 => '0',
                    I1 => '1',
                    A => qint(2),
                    Y => d(1));



U4: MUX4 port map (i0 => '0',
                   i1 => '1',
                   i2 => '0',
                   i3 => '1',
                   a0 => qint(1),
                   a1 => qint(2),
                   y => d(0));
                   

en <= '0';

d(3)<='0';
q <= qint;

end Behavioral;
