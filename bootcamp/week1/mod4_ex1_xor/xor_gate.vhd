library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_structural is
	port(
		a: in std_logic;
		b: in std_logic;
		y: out std_logic
	);
end xor_structural;

architecture rt1 of xor_structural is
begin
	y<= (a and (not b)) or ((not a) and b);
end rt1;

