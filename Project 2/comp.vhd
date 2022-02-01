library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity comp is
port(
	a, b: in std_logic_vector (5 downto 0);
    f: out std_logic);
end comp;

--architecture declaration
architecture implementation of comp is

begin

	--structure statement
	f <= '1' when (a>b)
   		 else '0';
    
end implementation;