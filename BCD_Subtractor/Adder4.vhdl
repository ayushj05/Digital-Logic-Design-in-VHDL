library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Adder4 is
	port (a3, a2, a1, a0, b3, b2, b1, b0, m : in std_logic; 
			Cout, s3, s2, s1, s0 : out std_logic);
end entity Adder4;

architecture Struct of Adder4 is
	signal d0, d1, d2, d3, c0, c1, c2 : std_logic;
	
	component FULL_ADDER is
		port (a, b, cin : in std_logic; s, cout : out std_logic);
	end component FULL_ADDER;
begin
	XOR1 : XOR_2 port map (b0, m, d0);
	XOR2 : XOR_2 port map (b1, m, d1);
	XOR3 : XOR_2 port map (b2, m, d2);
	XOR4 : XOR_2 port map (b3, m, d3);
	FA1 : FULL_ADDER port map (a0, d0, m, s0, c0);
	FA2 : FULL_ADDER port map (a1, d1, c0, s1, c1);
	FA3 : FULL_ADDER port map (a2, d2, c1, s2, c2);
	FA4 : FULL_ADDER port map (a3, d3, c2, s3, Cout);
end Struct;