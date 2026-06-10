library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        coin5    : in  std_logic;   -- '1' for one clock cycle when 5p inserted
        coin10   : in  std_logic;   -- '1' for one clock cycle when 10p inserted
        dispense : out std_logic;   -- '1' for one cycle when item is released
        change   : out std_logic    -- '1' for one cycle when 5p change is given
    );
end vending_machine;

architecture rtl of vending_machine is
	type state_type is (VRESET, ZERO, FIVE,TEN, VDISPENSE, VCHANGE);
	signal current_state: state_type;
	signal next_state: state_type;

begin
	state_reg: process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				current_state<=VRESET;
			else
				current_state<=next_state;
			end if;
		end if;
	end process state_reg;

	comb_logic: process(current_state, coin5, coin10)
	begin
		next_state<=current_state;
		dispense<='0';
		change<='0';
		case current_state is
			when VRESET =>
				next_state<=ZERO;
			when ZERO =>
				if coin5='1' then
					next_state<=FIVE;
				elsif coin10='1' then
					next_state<=TEN;
				end if;

			when FIVE =>
				if coin5='1' then
					next_state<=TEN;
				elsif coin10='1' then
					next_state<=VDISPENSE;
				end if;
			when TEN =>
				if coin5='1' then
					next_state<=VDISPENSE;
				elsif coin10='1' then
					next_state<=VCHANGE;
				end if;
			when VDISPENSE =>
				dispense<='1';
				change<='0';
				next_state<=ZERO;
			when VCHANGE =>
				change<='1';
				dispense<='1';
				next_state<=ZERO;
			when others =>
				next_state<=ZERO;
		end case;
	end process comb_logic;
end rtl;
