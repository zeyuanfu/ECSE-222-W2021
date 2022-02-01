library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity so is
port(
	in1, in2: in std_logic_vector (5 downto 0);
    out1, out2: out std_logic_vector (5 downto 0);
    permutation_out: out std_logic);
end so;

--architecture declaration
architecture implementation of so is

--intermediary signal declaration
signal perm: std_logic;

--external component import
component comp
	port(
		a, b: in std_logic_vector (5 downto 0);
    	f: out std_logic);
end component;

component mux_so
	port(
    	a, b: in std_logic_vector (5 downto 0);
        s: in std_logic;
        y: out std_logic_vector (5 downto 0));
end component;

begin

	--comparator
	comp0: comp port map (a => in1, b => in2, f => perm);
    
    --mux
    mux0: mux_so port map (a => in1, b => in2, s => perm, y=> out1);
    mux1: mux_so port map (a => in2, b => in1, s => perm, y=> out2);
    
    --signal assignment
    permutation_out <= perm;
    
end implementation;