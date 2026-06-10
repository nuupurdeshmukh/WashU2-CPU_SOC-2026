library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux2_en is
end tb_mux2_en;

architecture sim of tb_mux2_en is

    signal a, b, sel, en, y : std_logic;

begin

    uut : entity work.mux2_en
        port map(
            a   => a,
            b   => b,
            sel => sel,
            en  => en,
            y   => y
        );

    stimulus : process
    begin

        -- Test 1: disabled
        a <= '0';
        b <= '1';
        sel <= '0';
        en <= '0';
        wait for 10 ns;

        -- Test 2: enabled, select a
        a <= '0';
        b <= '1';
        sel <= '0';
        en <= '1';
        wait for 10 ns;

        -- Test 3: enabled, select b
        a <= '0';
        b <= '1';
        sel <= '1';
        en <= '1';
        wait for 10 ns;

        -- Test 4: change a, still selecting a
        a <= '1';
        b <= '0';
        sel <= '0';
        en <= '1';
        wait for 10 ns;

        -- Test 5: change b, still selecting b
        a <= '1';
        b <= '0';
        sel <= '1';
        en <= '1';
        wait for 10 ns;

        -- Test 6: disabled again
        a <= '1';
        b <= '1';
        sel <= '1';
        en <= '0';
        wait for 10 ns;

        wait;

    end process;

end sim;

