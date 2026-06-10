library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity detector is
	port (
        	clk      : in  std_logic;
        	reset    : in  std_logic;
        	data     : in  std_logic;
        	detected : out std_logic
    	);
end detector;

architecture rtl of detector is
	type state_type is (INIT, O, OZ, OZO);
	signal current_state: state_type;
	signal next_state: state_type;

begin
	state_reg: process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				current_state<=INIT;
			else
				current_state<=next_state;
			end if;
		end if;
	end process state_reg;

	comb_logic: process(current_state, data)
	begin
		next_state<=current_state;
		detected<='0';
		case current_state is
		
			when INIT=>
				if data='1' then
					next_state<=O;
				elsif data='0' then
					next_state<=INIT;
				end if;

			when O=>
				if data='1' then
					next_state<=O;
				elsif data='0' then
					next_state<=OZ;
				end if;

			when OZ=>
				if data='1' then 
					next_state<=OZO;
				elsif data='0' then
					next_state<=INIT;
				end if;
			
			when OZO=>
				detected<='1';
				next_state<=INIT;

			when others=>
				next_state<=INIT;
			
		end case;
	end process comb_logic;
end rtl;
