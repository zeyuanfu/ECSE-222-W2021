library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity sw is
port(
	idx1, idx2: in std_logic_vector (2 downto 0);
    permutation_in: in std_logic;
    out_idx1, out_idx2: out std_logic_vector (2 downto 0));
end sw;

--architecture declaration
architecture implementation of sw is

--external component import
component mux_sw
	port(
    	a, b: in std_logic_vector (2 downto 0);
        s: in std_logic;
        y: out std_logic_vector (2 downto 0));
end component;

begin
   
    --mux
    mux0: mux_sw port map (a => idx1, b => idx2, s => permutation_in, y=> out_idx1);
    mux1: mux_sw port map (a => idx2, b => idx1, s => permutation_in, y=> out_idx2);
    
end implementation;