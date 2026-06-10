library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mod_counter is
		generic(
		        N : integer := 10
		);
	
		port(
		clk: in std_logic;
		reset: in std_logic;
		enable: in std_logic;
		tick: out std_logic;
		count: out std_logic_vector(3 downto 0)
	);
end mod_counter;

architecture rtl of mod_counter is
	signal count_int: std_logic_vector (3 downto 0) := (others =>'0');
	signal tick1: std_logic:='0';
begin
	process (clk, reset, enable)
	begin
		if reset='1' then
			count_int<= (others=> '0');
			tick1<='0';
		elsif rising_edge(clk) then
			tick1<='0';
			if enable='1' then
				if to_integer(unsigned(count_int))<N-1 then
					count_int<=std_logic_vector(unsigned(count_int)+1);
					tick1<='0';
				else 
					count_int<=(others=>'0');
					tick1<='1';
				end if;
			end if;
		end if;
	end process;
	count<=count_int;
	tick<=tick1;
end rtl;
