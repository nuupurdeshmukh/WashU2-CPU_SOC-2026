library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity washu2_ram_ex2 is
    port (
        clk      : in  std_logic;
        we       : in  std_logic;
        addr     : in  std_logic_vector(11 downto 0);
        data_in  : in  std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end washu2_ram_ex2;

architecture rtl of washu2_ram_ex2 is
    type ram_type is array (0 to 4095) of std_logic_vector(15 downto 0);
    
    signal ram_mem : ram_type := (
        0      => x"202A",
        1      => x"1000",
        2      => x"0000",
        others => x"0000"
    );
    
    attribute ramstyle : string;
    attribute ramstyle of ram_mem : signal is "block";
    
    signal data_out_reg : std_logic_vector(15 downto 0) := (others => '0');
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
