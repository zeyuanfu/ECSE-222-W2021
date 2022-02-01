library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity msbn is
port(
	in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8: in std_logic_vector (5 downto 0);
    out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8: out std_logic_vector (2 downto 0));
end msbn;

--architecture declaration
architecture implementation of msbn is

--intermediary signal declaration
signal so1p, so2p, so3p, so4p, so5p, so6p, so7p, so8p, so9p, so10p, so11p, so12p, so13p, so14p, so15p, so16p, so17p, so18p, so19p: std_logic;
signal so10, so11, so20, so21, so30, so31, so40, so41, so50, so51, so60, so61, so70, so71, so80, so81, so90, so91, so100, so101, so110, so111, so120, so121, so130, so131, so140, so141, so150, so151, so160, so161, so170, so171, so180, so181, so190, so191: std_logic_vector (5 downto 0);
signal sw10, sw11, sw20, sw21, sw30, sw31, sw40, sw41, sw50, sw51, sw60, sw61, sw70, sw71, sw80, sw81, sw90, sw91, sw100, sw101, sw110, sw111, sw120, sw121, sw130, sw131, sw140, sw141, sw150, sw151, sw160, sw161, sw170, sw171, sw180, sw181, sw190, sw191: std_logic_vector (2 downto 0);

--external component import
component so
	port(
		in1, in2: in std_logic_vector (5 downto 0);
    	out1, out2: out std_logic_vector (5 downto 0);
    	permutation_out: out std_logic);
end component;

component sw
	port(
		idx1, idx2: in std_logic_vector (2 downto 0);
    	permutation_in: in std_logic;
    	out_idx1, out_idx2: out std_logic_vector (2 downto 0));
end component;


begin

	--sorters

	--level 1 sorter
    so1: so port map (in1 => in_1, in2 => in_2, out1 => so10, out2 => so11, permutation_out => so1p);
    so2: so port map (in1 => in_3, in2 => in_4, out1 => so20, out2 => so21, permutation_out => so2p);
    so3: so port map (in1 => in_5, in2 => in_6, out1 => so30, out2 => so31, permutation_out => so3p);
    so4: so port map (in1 => in_7, in2 => in_8, out1 => so40, out2 => so41, permutation_out => so4p);
	
	--level 2 sorter
    so5: so port map (in1 => so10, in2 => so30, out1 => so50, out2 => so51, permutation_out => so5p);
    so6: so port map (in1 => so20, in2 => so40, out1 => so60, out2 => so61, permutation_out => so6p);
    so7: so port map (in1 => so11, in2 => so31, out1 => so70, out2 => so71, permutation_out => so7p);
    so8: so port map (in1 => so21, in2 => so41, out1 => so80, out2 => so81, permutation_out => so8p);
    
    --level 3 sorter
    so9: so port map (in1 => so50, in2 => so60, out1 => so90, out2 => so91, permutation_out => so9p);
    so_ten: so port map (in1 => so51, in2 => so70, out1 => so100, out2 => so101, permutation_out => so10p);
    so_eleven: so port map (in1 => so61, in2 => so80, out1 => so110, out2 => so111, permutation_out => so11p);
    so12: so port map (in1 => so71, in2 => so81, out1 => so120, out2 => so121, permutation_out => so12p);
    
    --level 4 sorter
    so13: so port map (in1 => so100, in2 => so110, out1 => so130, out2 => so131, permutation_out => so13p);
    so14: so port map (in1 => so101, in2 => so111, out1 => so140, out2 => so141, permutation_out => so14p);
    
    --level 5 sorter
    so15: so port map (in1 => so91, in2 => so140, out1 => so150, out2 => so151, permutation_out => so15p);
    so16: so port map (in1 => so131, in2 => so120, out1 => so160, out2 => so161, permutation_out => so16p);
    
    --level 6 sorter
    so17: so port map (in1 => so150, in2 => so130, out1 => so170, out2 => so171, permutation_out => so17p);
    so18: so port map (in1 => so160, in2 => so151, out1 => so180, out2 => so181, permutation_out => so18p);
    so19: so port map (in1 => so141, in2 => so161, out1 => so190, out2 => so191, permutation_out => so19p);

	--switchers

    --level 6 switcher
    sw17: sw port map (idx1 => "001", idx2 => "010", permutation_in => so17p, out_idx1 => sw170, out_idx2 => sw171);
    sw18: sw port map (idx1 => "011", idx2 => "100", permutation_in => so18p, out_idx1 => sw180, out_idx2 => sw181);
    sw19: sw port map (idx1 => "101", idx2 => "110", permutation_in => so19p, out_idx1 => sw190, out_idx2 => sw191);
    
    --level 5 switcher
    sw15: sw port map (idx1 => sw170, idx2 => sw181, permutation_in => so15p, out_idx1 => sw150, out_idx2 => sw151);
    sw16: sw port map (idx1 => sw180, idx2 => sw191, permutation_in => so16p, out_idx1 => sw160, out_idx2 => sw161);
    
    --level 4 switcher
    sw13: sw port map (idx1 => sw171, idx2 => sw160, permutation_in => so13p, out_idx1 => sw130, out_idx2 => sw131);
    sw14: sw port map (idx1 => sw151, idx2 => sw190, permutation_in => so14p, out_idx1 => sw140, out_idx2 => sw141);
    
    --level 3 switcher
    sw9: sw port map (idx1 => "000", idx2 => sw150, permutation_in => so9p, out_idx1 => sw90, out_idx2 => sw91);
    sw_ten: sw port map (idx1 => sw130, idx2 => sw140, permutation_in => so10p, out_idx1 => sw100, out_idx2 => sw101);
    sw_eleven: sw port map (idx1 => sw131, idx2 => sw141, permutation_in => so11p, out_idx1 => sw110, out_idx2 => sw111);
    sw12: sw port map (idx1 => sw161, idx2 => "111", permutation_in => so12p, out_idx1 => sw120, out_idx2 => sw121);
    
    --level 2 switcher
    sw5: sw port map (idx1 => sw90, idx2 => sw100, permutation_in => so5p, out_idx1 => sw50, out_idx2 => sw51);
    sw6: sw port map (idx1 => sw91, idx2 => sw110, permutation_in => so6p, out_idx1 => sw60, out_idx2 => sw61);
    sw7: sw port map (idx1 => sw101, idx2 => sw120, permutation_in => so7p, out_idx1 => sw70, out_idx2 => sw71);
    sw8: sw port map (idx1 => sw111, idx2 => sw121, permutation_in => so8p, out_idx1 => sw80, out_idx2 => sw81);
    
    --level 1 switcher
    sw1: sw port map (idx1 => sw50, idx2 => sw70, permutation_in => so1p, out_idx1 => out_1, out_idx2 => out_2);
    sw2: sw port map (idx1 => sw60, idx2 => sw80, permutation_in => so2p, out_idx1 => out_3, out_idx2 => out_4);
    sw3: sw port map (idx1 => sw51, idx2 => sw71, permutation_in => so3p, out_idx1 => out_5, out_idx2 => out_6);
    sw4: sw port map (idx1 => sw61, idx2 => sw81, permutation_in => so4p, out_idx1 => out_7, out_idx2 => out_8);  
    
    
end implementation;