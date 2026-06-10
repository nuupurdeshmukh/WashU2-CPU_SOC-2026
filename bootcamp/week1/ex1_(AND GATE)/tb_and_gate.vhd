library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end tb_and_gate;

architecture sim of tb_and_gate is

	signal a: std_logic:= '0';
	signal b: std_logic:= '0';	
	signal y: std_logic;

begin 
	uut: entity work.and_gate
		port map(
			a => a,
			b=> b,
			y=> y
		);

	process
	begin
		a<= '0'; b<= '0';
		wait for 10 ns;

		a<= '0'; b<= '1';
                wait for 10 ns;


		a<= '1'; b<= '0';
                wait for 10 ns;

		a<= '1'; b<= '1';
                wait for 10 ns;

		wait;
	end process;

end sim;
