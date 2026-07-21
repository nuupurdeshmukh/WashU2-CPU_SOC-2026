library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mini_cpu_ex1 is
end tb_mini_cpu_ex1;

architecture behavior of tb_mini_cpu_ex1 is

    component mini_cpu
    port(
         clk       : in  std_logic;
         reset     : in  std_logic;
         done      : out std_logic;
         dbg_acc   : out std_logic_vector(7 downto 0);
         dbg_pc    : out std_logic_vector(4 downto 0);
         dbg_ir    : out std_logic_vector(7 downto 0);
         dbg_state : out std_logic_vector(2 downto 0)
        );
    end component;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal done      : std_logic;
    signal dbg_acc   : std_logic_vector(7 downto 0);
    signal dbg_pc    : std_logic_vector(4 downto 0);
    signal dbg_ir    : std_logic_vector(7 downto 0);
    signal dbg_state : std_logic_vector(2 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: mini_cpu port map (
          clk => clk,
          reset => reset,
          done => done,
          dbg_acc => dbg_acc,
          dbg_pc => dbg_pc,
          dbg_ir => dbg_ir,
          dbg_state => dbg_state
        );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for clk_period * 3;
        reset <= '0';

        wait until done = '1' for clk_period * 25;
        
        assert done = '1' severity failure;
        assert dbg_acc = x"14" severity failure;

        wait for clk_period;
        assert done = '1' severity failure;
        wait for clk_period;
        assert done = '1' severity failure;
        wait for clk_period;
        assert done = '1' severity failure;

        reset <= '1';
        wait for clk_period;
        assert done = '0' severity failure;
        
        wait for clk_period * 2;
        reset <= '0';

        wait;
    end process;

end behavior;
