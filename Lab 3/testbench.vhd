library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- component declaration
component fp_adder is
port(
	A,B : in std_logic_vector (31 downto 0);
    S: out std_logic_vector (31 downto 0));
end component;

--signal declaration
signal A_in, B_in, S_out: std_logic_vector (31 downto 0);


begin

	--connect DUT
	DUT: fp_adder port map (A_in, B_in, S_out);
    process
    begin
    
    	--testing 
    	        
    	A_in <= "01000001110000000000000000000000";
        B_in <= "01000001110000000000000000000000";
        wait for 1 ns;
        
        A_in <= "01000001110000000000000000000000";
        B_in <= "11000001110000000000000000000000";
        wait for 1 ns;
        
        A_in <= "01000111111100010010000001100101";
        B_in <= "01001001011100010010000001100101";
        wait for 1 ns;
        
        A_in <= "11001000110111101011011101111001";
        B_in <= "01001001010000001011110100000010";
        wait for 1 ns;
        
        A_in <= "00000000000000000000000000000000";
        B_in <= "00000000000000000000000000000000";
        wait for 1 ns;
        
    	A_in <= "01111111100000000000000000000000";
        B_in <= "11111111100000000000000000000000";
        wait for 1 ns;
        
    	A_in <= "11111111100000000000000000000000";
        B_in <= "01111111100000000000000000000000";
        wait for 1 ns;
        
        A_in <= "11111111100000000000000000000000";
        B_in <= "11111111100000000000000000000000";
        wait for 1 ns;
        
        A_in <= "01111111100000000000000000000000";
        B_in <= "01111111100000000000000000000000";
        wait for 1 ns;
        
        A_in <= "01111111100000000000000000000000";
        B_in <= "01000010110010001011001100110011";
        wait for 1 ns;
        
        A_in <= "01000001110011001010001111010111";
        B_in <= "11111111100000000000000000000000";
        wait for 1 ns;
        
        --clear inputs
        A_in <= "00000000000000000000000000000000";
        B_in <= "00000000000000000000000000000000";
        wait for 1 ns;
        
        wait;
    end process;
end tb;