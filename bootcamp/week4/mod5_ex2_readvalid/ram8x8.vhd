library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram8x8 is
    port(
        clk      : in std_logic;
        reset    : in std_logic;
        we       : in std_logic;
        addr     : in std_logic_vector(2 downto 0);
        data_in  : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        valid    : out std_logic
    );
end ram8x8;

architecture rtl of ram8x8 is

    type ram_type is array(0 to 7) of std_logic_vector(7 downto 0);

    signal ram_mem : ram_type := (others => (others => '0'));

    signal data_out_reg : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_reg : std_logic := '0';
    signal read_pending : std_logic := '0';

begin

    process(clk)
    begin
        if rising_edge(clk) then

            if reset='1' then
                data_out_reg <= (others => '0');
                valid_reg <= '0';
                read_pending <= '0';

            elsif we='1' then
                ram_mem(to_integer(unsigned(addr))) <= data_in;
                valid_reg <= '0';
                read_pending <= '0';

            else
                data_out_reg <= ram_mem(to_integer(unsigned(addr)));
                valid_reg <= read_pending;
                read_pending <= '1';

            end if;

        end if;
    end process;

    data_out <= data_out_reg;
    valid <= valid_reg;

end rtl;

