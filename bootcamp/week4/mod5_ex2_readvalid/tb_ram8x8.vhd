library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ram8x8 is
end tb_ram8x8;

architecture sim of tb_ram8x8 is

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal we : std_logic := '0';

    signal addr : std_logic_vector(2 downto 0) := (others => '0');
    signal data_in : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0) := (others => '0');
    signal valid : std_logic := '0';

    constant CLK_PERIOD : time := 10 ns;

begin

    clk <= not clk after CLK_PERIOD/2;

    uut : entity work.ram8x8
        port map(
            clk => clk,
            reset => reset,
            we => we,
            addr => addr,
            data_in => data_in,
            data_out => data_out,
            valid => valid
        );

    stimulus : process
    begin

        reset <= '1';
        wait for 2*CLK_PERIOD;
        reset <= '0';

        -- write addr 0
        we <= '1';
        addr <= "000";
        data_in <= x"AA";
        wait for CLK_PERIOD;

        -- write addr 1
        addr <= "001";
        data_in <= x"BB";
        wait for CLK_PERIOD;

        -- write addr 2
        addr <= "010";
        data_in <= x"CC";
        wait for CLK_PERIOD;

        -- write addr 3
        addr <= "011";
        data_in <= x"DD";
        wait for CLK_PERIOD;

        -- read addr 0
        we <= '0';
        addr <= "000";
        wait for CLK_PERIOD;

        -- read addr 1
        addr <= "001";
        wait for CLK_PERIOD;

        -- read addr 2
        addr <= "010";
        wait for CLK_PERIOD;

        -- read addr 3
        addr <= "011";
        wait for CLK_PERIOD;

        -- write updated value
        we <= '1';
        addr <= "000";
        data_in <= x"EE";
        wait for CLK_PERIOD;

        -- read updated value
        we <= '0';
        addr <= "000";
        wait for 2*CLK_PERIOD;

        wait;
    end process;

end sim;
