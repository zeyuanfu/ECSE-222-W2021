library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity barrel_shifter_behavioral is
port(
	x: in std_logic_vector (3 downto 0);
    sel: in std_logic_vector (1 downto 0);
    y: out std_logic_vector (3 downto 0));
end barrel_shifter_behavioral;

--architecture declaration
architecture implementation of barrel_shifter_behavioral is

begin

	--assignment statements
	with sel select
    y <= x when "00",
    	 x(2) & x(1) & x(0) & x(3) when "01",
         x(1) & x(0) & x(3) & x(2) when "10",
         x(0) & x(3) & x(2) & x(1) when others;
    
    
end implementation;
