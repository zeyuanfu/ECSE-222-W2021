library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- component declaration
component barrel_shifter_behavioral is
port(
	x: in std_logic_vector (3 downto 0);
    sel: in std_logic_vector (1 downto 0);
    y: out std_logic_vector (3 downto 0));
end component;

--signal declaration
signal x_in, y_out: std_logic_vector (3 downto 0);
signal sel_in: std_logic_vector (1 downto 0);

begin

	-- connect DUT
	DUT: barrel_shifter_behavioral port map (x_in, sel_in, y_out);
    process
    begin
    
    	--shift 1110 by 0 bits
    	x_in <= "1110";
        sel_in <= "00";
        wait for 1 ns;
        
        --shift 1110 by 1 bit
        x_in <= "1110";
        sel_in <= "01";
        wait for 1 ns;
        
        --shift 1110 by 2 bits
        x_in <= "1110";
        sel_in <= "10";
        wait for 1 ns;
        
        --shift 1110 by 3 bits
        x_in <= "1110";
        sel_in <= "11";
        wait for 1 ns;
    	        
        -- Clear inputs
        x_in <= "0000";
        sel_in <= "00";
        
        wait;
    end process;
end tb;
