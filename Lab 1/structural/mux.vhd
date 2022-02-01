library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
port(
	a: in std_logic;
    b: in std_logic;
    s: in std_logic;
    y: out std_logic);
end mux;

architecture implementation of mux is
begin

	y <= (a and not s) or (b and s);
    
end implementation;