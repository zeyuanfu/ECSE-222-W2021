library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_STD.all;
entity booth_mult is
port(
		in_1, in_2: in std_logic_vector (7 downto 0);
        clk, ready: in std_logic;
        done: out std_logic;
        s: out std_logic_vector (15 downto 0));
end booth_mult;

--architecture declaration
architecture implementation of booth_mult is

--intermediary signal declaration
signal count: integer range 0 to 15;
signal m1, q1: signed(7 downto 0);
signal tempProduct, product2: signed (16 downto 0);
signal tempDone: std_logic; 

begin

	--initialization/shift
	assignment: process(ready, clk)
	begin
    
    	--assignment of multiplier and multiplicand, initialization of ppa
    	if ready = '1' then
        	tempDone <= '0';
    	    done <= '0';
    	    count <= 0;
    	    m1 <= signed(in_1);
    	    q1 <= signed(in_2);
    	    tempProduct <= "00000000" & signed(in_2) & '0';
           
    
    	elsif rising_edge(clk) then
        	
            --count increment and arithmetic shift
            if tempDone /= '1' then
            count <= count + 1;
            tempProduct <= product2(16) & product2(16 downto 1);
			end if;
			
            --done assignment
			if count = 7 then
    	    tempDone <= '1';
            done <= '1';
    		end if;
            
	    end if;
    
    	

	end process;

	
    --addition/subtraction of multiplicand and ppa
	addition: process(tempProduct, m1)
	begin

		--ppa - multiplicand
		if tempProduct(1 downto 0) = "10" then 
    		product2 <= (-m1 + tempProduct(16 downto 9)) & tempProduct(8 downto 0);
        --ppa + multiplicand
        elsif tempProduct(1 downto 0) = "01" then 
            product2<= (m1 + tempProduct(16 downto 9)) & tempProduct(8 downto 0);
        --no change
        else product2 <= tempProduct;
    	end if;

	end process;
	

	--sum assignment
	sum: process(tempProduct, tempDone)
	begin
    
		if tempDone = '1' then
    	    S <= std_logic_vector(tempProduct(16 downto 1));
        else S <= "0000000000000000";
    	end if;
        
	end process;
    
end implementation;