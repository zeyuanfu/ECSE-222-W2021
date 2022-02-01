library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity mux_so is
port(
	a, b: in std_logic_vector (5 downto 0);
    s: in std_logic;
    y: out std_logic_vector (5 downto 0));
end mux_so;

--architecture declaration
architecture implementation of mux_so is

begin

	--assignment statement
	with s select
	y <= a when '0',
      	b when others;
    
end implementation;