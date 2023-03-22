library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity cnt is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           ld : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           cy : out STD_LOGIC);
end cnt;

architecture Behavioral of cnt is

signal qint: std_logic_vector(3 downto 0):= "0011";

begin
q <= qint;
cy <= '1' when ( qint = "1111" and en ='1') else '0';
  
  process(clk,rst)
   begin
   if rst = '0' then qint <= "0000";
   elsif falling_edge(clk) then
     if ld = '1' then qint <= d;
     elsif en = '0' then qint <= qint + 1;
     end if;
     else qint <= qint;
   end if; 
   end process;
q <= qint;
  
end Behavioral;
