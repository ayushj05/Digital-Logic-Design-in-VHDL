library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Fibonacci is
	port (x3, x2, x1, x0 : in std_logic; output : out std_logic);
end entity Fibonacci;

architecture Struct of Fibonacci is
	signal x0_bar, x1_bar, x2_bar, x3_bar, s1, s2, s3 : std_logic;
begin
	NOT1 : INVERTER port map (x0, x0_bar);
	NOT2 : INVERTER port map (x1, x1_bar);
	NOT3 : INVERTER port map (x2, x2_bar);
	NOT4 : INVERTER port map (x3, x3_bar);
	AND1 : AND_2 port map (x2_bar, x3_bar, s3);
	AND2 : AND_3 port map (x0_bar, x1_bar, x2_bar, s2);
	AND3 : AND_3 port map (x0, x1_bar, x2, s1);
	OR1 : OR_3 port map (s1, s2, s3, output);
end Struct;