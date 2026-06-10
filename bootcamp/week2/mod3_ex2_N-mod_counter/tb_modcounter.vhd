library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_modcounter is
end tb_modcounter;

architecture sim of tb_modcounter is
	signal clk, enable: std_logic:='0';
	signal reset: std_logic:='1';
	signal count: std_logic_vector(3 downto 0);
	signal tick:std_logic:='0';
	constant CLK_PERIOD: time:= 10 ns;

begin
	clk<=not clk after CLK_PERIOD/2;
	uut: entity work.mod_counter
		port map(
			clk=>clk,
			reset=>reset,
			enable=>enable,
			count=>count,
			tick=>tick
		);

	stimulus:process
	begin
       	        reset <= '1';
               	enable <= '0';
               	wait for 25 ns;

               	reset <= '0';
              	enable <= '1';
               	wait for 25*CLK_PERIOD;

               	enable <= '0';
               	wait for 5*CLK_PERIOD;
	
       	        enable <= '1';
       	        wait for 15*CLK_PERIOD;
	
               	wait;
       	end process;

end sim;
