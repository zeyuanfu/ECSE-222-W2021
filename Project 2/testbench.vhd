library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- component declaration
component msbn is
port(
	in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8: in std_logic_vector (5 downto 0);
    out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8: out std_logic_vector (2 downto 0));
end component;

--signal declaration
signal in_1_in, in_2_in, in_3_in, in_4_in, in_5_in, in_6_in, in_7_in, in_8_in: std_logic_vector (5 downto 0);
signal out_1_out, out_2_out, out_3_out, out_4_out, out_5_out, out_6_out, out_7_out, out_8_out: std_logic_vector (2 downto 0);

begin

	--connect DUT
	DUT: msbn port map (in_1_in, in_2_in, in_3_in, in_4_in, in_5_in, in_6_in, in_7_in, in_8_in, out_1_out, out_2_out, out_3_out, out_4_out, out_5_out, out_6_out, out_7_out, out_8_out);
    process
    begin
    
    	--testing 
    	in_1_in <= "000001";
        in_2_in <= "000010";
        in_3_in <= "000011";
        in_4_in <= "000100";
        in_5_in <= "000101";
        in_6_in <= "000110";
        in_7_in <= "000111";
        in_8_in <= "001000";
        wait for 1 ns;
        
    	in_1_in <= "001000";
        in_2_in <= "000111";
        in_3_in <= "000110";
        in_4_in <= "000101";
        in_5_in <= "000100";
        in_6_in <= "000011";
        in_7_in <= "000010";
        in_8_in <= "000001";
        wait for 1 ns;
        
    	in_1_in <= "000001";
        in_2_in <= "000011";
        in_3_in <= "000101";
        in_4_in <= "000111";
        in_5_in <= "000010";
        in_6_in <= "000100";
        in_7_in <= "000110";
        in_8_in <= "001000";
        wait for 1 ns;
        
    	in_1_in <= "000010";
        in_2_in <= "000100";
        in_3_in <= "000110";
        in_4_in <= "001000";
        in_5_in <= "000001";
        in_6_in <= "000011";
        in_7_in <= "000101";
        in_8_in <= "000111";
        wait for 1 ns;
        
        --clear inputs
        in_1_in <= "000000";
        in_2_in <= "000000";
        in_3_in <= "000000";
        in_4_in <= "000000";
        in_5_in <= "000000";
        in_6_in <= "000000";
        in_7_in <= "000000";
        in_8_in <= "000000";
        wait for 1 ns;
        
        wait;
    end process;
end tb;