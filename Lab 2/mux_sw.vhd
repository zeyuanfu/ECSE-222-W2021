library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity mux_sw is
port(
	a, b: in std_logic_vector (2 downto 0);
    s: in std_logic;
    y: out std_logic_vector (2 downto 0));
end mux_sw;

--architecture declaration
architecture implementation of mux_sw is

begin

	--assignment statement
	with s select
	y <= a when '0',
      	b when others;
    
end implementation;