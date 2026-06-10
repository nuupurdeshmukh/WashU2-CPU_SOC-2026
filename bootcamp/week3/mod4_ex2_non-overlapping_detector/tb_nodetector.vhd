library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_nodetector is
end tb_nodetector;

architecture rtl of tb_nodetector is
	signal clk: std_logic:='0';
	signal reset:std_logic:='0';
	signal data:std_logic:='0';
	signal detected:std_logic;
 
	constant CLK_PERIOD : time := 10 ns;
	



begin
	clk<=not clk after CLK_PERIOD/2;
	uut: entity work.detector
		port map(
			clk=>clk,
			reset=>reset,
			data=>data,
			detected=>detected
		);

	stimulus: process
	begin
		reset<='1';
		wait for 2*CLK_PERIOD;
		reset<='0';
		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '0';

		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '1';

		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';

		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '1';
	
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '1';

		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '0';

		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '1';

		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '1';
		wait until rising_edge(clk); data <= '0';
		wait until rising_edge(clk); data <= '0';

		wait for 5 * CLK_PERIOD;
		wait;		
	end process stimulus;
end rtl;
