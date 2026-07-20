library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu4_extended is
    port(
        a        : in std_logic_vector(3 downto 0);
        b        : in std_logic_vector(3 downto 0);
        op       : in std_logic_vector(2 downto 0);
        result   : out std_logic_vector(3 downto 0);
        zero     : out std_logic;
        carry    : out std_logic;
        negative : out std_logic
    );
end alu4_extended;

architecture rtl of alu4_extended is

    signal result_int : std_logic_vector(3 downto 0) := (others => '0');
    signal carry_int  : std_logic := '0';

    signal a5,b5,sum5 : unsigned(4 downto 0);

begin

    a5 <= '0' & unsigned(a);
    b5 <= '0' & unsigned(b);
    sum5 <= a5 + b5;

    process(a,b,op,sum5)
    begin

        result_int <= (others => '0');
        carry_int <= '0';

        case op is

            when "000" =>
                result_int <= std_logic_vector(sum5(3 downto 0));
                carry_int <= sum5(4);

            when "001" =>
                result_int <= std_logic_vector(unsigned(a)-unsigned(b));

            when "010" =>
                result_int <= a and b;

            when "011" =>
                result_int <= a or b;

            when "100" =>
                result_int <= a xor b;

            when "101" =>
                result_int <= not a;

            when "110" =>
                result_int <= std_logic_vector(-signed(a));

            when others =>
                result_int <= (others => '0');

        end case;

    end process;

    result <= result_int;

    zero <= '1' when unsigned(result_int)=0 else '0';

    carry <= carry_int;

    negative <= result_int(3);

end rtl;
