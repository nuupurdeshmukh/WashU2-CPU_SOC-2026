library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_xor is
end tb_xor;

architecture sim of tb_xor is

	signal a,b,y: std_logic;

begin

	uut: entity work.xor_structural
		port map(
			a=>a,
			b=>b,
			y=>y
		);

	potato: process
	begin
		a<='0' ; b<='0';
		wait for 10 ns;

		a<='0' ; b<='1';
        	wait for 10 ns;

		a<='1' ; b<='0';
        	wait for 10 ns;

		a<='1' ; b<='1';
        	wait for 10 ns;


		wait;
	end process;
end sim;
