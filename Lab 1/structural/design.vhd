library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity barrel_shifter_structural is
port(
	x: in std_logic_vector (3 downto 0);
    sel: in std_logic_vector (1 downto 0);
    y: out std_logic_vector (3 downto 0));
end barrel_shifter_structural;

--architecture declaration
architecture implementation of barrel_shifter_structural is

--intermediary signal declaration
signal out0, out1, out2, out3: std_logic;

--external component import
component mux
	port(
    	a, b, s: in std_logic;
        y: out std_logic);
end component;

begin

	--level 1 mux
	mux0: mux port map (a => x(0), b => x(2), s => sel(1), y=> out0);
    mux1: mux port map (a => x(1), b => x(3), s => sel(1), y=> out1);
    mux2: mux port map (a => x(2), b => x(0), s => sel(1), y=> out2);
    mux3: mux port map (a => x(3), b => x(1), s => sel(1), y=> out3);
    
    --level 2 mux
    mux4: mux port map (a => out0, b => out3, s => sel(0), y=> y(0));
    mux5: mux port map (a => out1, b => out0, s => sel(0), y=> y(1));
    mux6: mux port map (a => out2, b => out1, s => sel(0), y=> y(2));
    mux7: mux port map (a => out3, b => out2, s => sel(0), y=> y(3));
        
    
end implementation;