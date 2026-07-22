library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_washu2_week7_ex2 is
end tb_washu2_week7_ex2;

architecture sim of tb_washu2_week7_ex2 is
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal done  : std_logic;
    constant CLK_PERIOD : time := 10 ns;
begin
    clk <= not clk after CLK_PERIOD / 2;

    uut : entity work.washu2_cpu_ex2
        port map (
            clk   => clk,
            reset => reset,
            done  => done
        );

    stimulus : process
    begin
        reset <= '1';
        wait for 3 * CLK_PERIOD;
        reset <= '0';

        wait until done = '1' for 40 * CLK_PERIOD;
        assert done = '1' severity error;

        wait for 5 * CLK_PERIOD;
        assert done = '1' severity error;

        reset <= '1';
        wait for 2 * CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;
        assert done = '0' severity error;

        wait until done = '1' for 60 * CLK_PERIOD;
        assert done = '1' severity error;

        wait for 3 * CLK_PERIOD;
        wait;
    end process stimulus;
end sim;
