library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder is
end tb_adder;

architecture sim1 of tb_adder is

	signal a,b,sum,carry: std_logic;

begin
	uut: entity work.half_adder
		port map(
			a=>a,
			b=>b,
			sum=>sum,
			carry=>carry
		);

	potato2: process
	begin

        a <= '0'; b <= '0';
        wait for 10 ns;          -- expect sum='0' carry='0'

        a <= '0'; b <= '1';
        wait for 10 ns;          -- expect sum='1' carry='0'

        a <= '1'; b <= '0';
        wait for 10 ns;          -- expect sum='1' carry='0'

        a <= '1'; b <= '1';
        wait for 10 ns;          -- expect sum='0' carry='1'

        wait;
    end process;

end sim1;
