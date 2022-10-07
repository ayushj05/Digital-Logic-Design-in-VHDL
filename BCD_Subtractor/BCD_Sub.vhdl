library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity BCD_Sub is
	port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic; 
			Y4, Y3, Y2, Y1, Y0 : out std_logic);
end entity BCD_Sub;

architecture Struct of BCD_Sub is
	signal Carry1, Carry2, Carry3, Carry4, C3, C2, C1, C0, D3, D2, D1, D0, E, F, G9, N3, N2, N1, N0, Y : std_logic;
	
	component Adder4 is
		port (a3, a2, a1, a0, b3, b2, b1, b0, m : in std_logic; 
			Cout, s3, s2, s1, s0 : out std_logic);
	end component Adder4;
begin
	Add1 : Adder4 port map ('1', '0', '1', '0', B3, B2, B1, B0, '1', Carry1, C3, C2, C1, C0);
	Add2 : Adder4 port map (A3, A2, A1, A0, C3, C2, C1, C0, '0', Carry2, D3, D2, D1, D0);
	OR1 : OR_2 port map (D2, D1, E);
	AND1 : AND_2 port map (D3, E, F);
	OR2 : OR_2 port map (Carry2, F, G9);
	Add3 : Adder4 port map ('0', G9, G9, '0', D3, D2, D1, D0, '0', Carry3, N3, N2, N1, N0);
	NOT1 : INVERTER port map (G9, Y);
	Add4 : Adder4 port map (Y, '0', Y, '0', N3, N2, N1, N0, Y, Carry4, Y3, Y2, Y1, Y0);
	Y4 <= Y;
end Struct;