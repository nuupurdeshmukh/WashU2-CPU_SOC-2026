library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram32x8 is
    port (
        clk      : in  std_logic;
        we       : in  std_logic;
        addr     : in  std_logic_vector(4 downto 0);
        data_in  : in  std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end ram32x8;

architecture rtl of ram32x8 is
    type ram_type is array (0 to 31) of std_logic_vector(7 downto 0);
    signal ram_mem : ram_type := (
        0  => x"10",
        1  => x"31",
        2  => x"32",
        3  => x"53",
        4  => x"60",
        16 => x"0F",
        17 => x"09",
        18 => x"FC",
        others => x"00"
    );
    signal data_out_reg : std_logic_vector(7 downto 0) := (others => '0');
begin
    mem_proc : process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram_mem(to_integer(unsigned(addr))) <= data_in;
            end if;
            data_out_reg <= ram_mem(to_integer(unsigned(addr)));
        end if;
    end process mem_proc;
    data_out <= data_out_reg;
end rtl;
