library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FULL_ADDER is
	port (a, b, cin : in std_logic; s, cout : out std_logic);
end entity FULL_ADDER;

architecture Struct of FULL_ADDER is
	signal s1, c1, c2 : std_logic;
begin
	HA1 : HALF_ADDER port map (a, b, s1, c1);
	HA2 : HALF_ADDER port map (s1, cin, s, c2);
	OR1 : OR_2 port map (c1, c2, cout);
end Struct;