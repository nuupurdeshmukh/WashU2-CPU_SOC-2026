library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu4_extended is
end tb_alu4_extended;

architecture sim of tb_alu4_extended is

    signal a,b : std_logic_vector(3 downto 0) := (others => '0');
    signal op : std_logic_vector(2 downto 0) := (others => '0');

    signal result : std_logic_vector(3 downto 0);
    signal zero, carry, negative : std_logic;

begin

    uut : entity work.alu4_extended
        port map(
            a => a,
            b => b,
            op => op,
            result => result,
            zero => zero,
            carry => carry,
            negative => negative
        );

    stimulus : process
    begin

        -- ADD
        a <= "0111";
        b <= "0001";
        op <= "000";
        wait for 20 ns;

        -- ADD with carry
        a <= "1111";
        b <= "0001";
        op <= "000";
        wait for 20 ns;

        -- SUB
        a <= "1001";
        b <= "0010";
        op <= "001";
        wait for 20 ns;

        -- AND
        a <= "1100";
        b <= "1010";
        op <= "010";
        wait for 20 ns;

        -- OR
        a <= "1100";
        b <= "1010";
        op <= "011";
        wait for 20 ns;

        -- XOR
        a <= "1010";
        b <= "1010";
        op <= "100";
        wait for 20 ns;

        -- NOT
        a <= "1000";
        op <= "101";
        wait for 20 ns;

        -- NEGATE
        a <= "0011";
        op <= "110";
        wait for 20 ns;

        -- others
        op <= "111";
        wait for 20 ns;

        wait;
    end process;

end sim;

