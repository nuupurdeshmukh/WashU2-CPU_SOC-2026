library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux is
end tb_mux;

architecture rt2 of tb_mux is

	signal a,b,sel,y :std_logic;

begin
	uut:entity work.mux2
		port map(
			a=>a,
			b=>b,
			sel=>sel,
			y=>y
		);
	
	potato1:process

	begin
		       -- Fixed, different values so routing is obvious: a=0, b=1.
        a <= '0';
        b <= '1';

        sel <= '0';
        wait for 10 ns;          -- expect y = a = '0'

        sel <= '1';
        wait for 10 ns;          -- expect y = b = '1'

        -- Swap the data values and test again: a=1, b=0.
        a <= '1';
        b <= '0';

        sel <= '0';
        wait for 10 ns;          -- expect y = a = '1'

        sel <= '1';
        wait for 10 ns;          -- expect y = b = '0'

        wait;
    end process;

end rt2;
