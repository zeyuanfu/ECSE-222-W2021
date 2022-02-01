library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- component declaration
component booth_mult is
port(
	in_1, in_2: in std_logic_vector (7 downto 0);
	clk, ready: in std_logic;
	done: out std_logic;
	s: out std_logic_vector (15 downto 0));
end component;

--signal declaration
signal in_1_in, in_2_in: std_logic_vector (7 downto 0);
signal ready_in, done_out: std_logic;
signal s_out: std_logic_vector (15 downto 0);
signal clk_in: std_logic := '0'; 

begin

	--connect DUT
	DUT: booth_mult port map (in_1_in, in_2_in, clk_in, ready_in, done_out, s_out);
    process
    begin
    
    	--testing 
    	in_1_in <= "11100110";
        in_2_in <= "11100110";
        ready_in <= '1';
        wait for 2 ns;
      	ready_in <= '0';
        wait for 16 ns;
        in_1_in <= "00101101";
        in_2_in <= "11010011";
		ready_in <= '1';
        wait for 2 ns;
      	ready_in <= '0';
        wait for 16 ns;
        in_1_in <= "11111101";
        in_2_in <= "01011010";
		ready_in <= '1';
        wait for 2 ns;
      	ready_in <= '0';

        wait;
    end process;
    
    clk_process: process
	begin
    	clk_in <= '0';
    	wait for 0.5 ns;  --for 0.5 ns signal is '0'.
    	clk_in <= '1';
    	wait for 0.5 ns;  --for next 0.5 ns signal is '1'.
	end process;
    
end tb;