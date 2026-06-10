library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
	port(
		a: in std_logic;
		b: in std_logic;
		sel: in std_logic;
		y: out std_logic
	);
end mux2;

architecture rt1 of mux2 is
begin
	y <= ((sel) and b) or ((not sel) and a);
end rt1;
