library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration
entity fp_adder is
port(
	A,B : in std_logic_vector (31 downto 0);
    S: out std_logic_vector (31 downto 0));
end fp_adder;

--architecture declaration
architecture implementation of fp_adder is

--intermediary signal declaration

--signals for step 0 (initialization)
signal signA, signB: std_logic;
signal expA, expB: std_logic_vector (7 downto 0);
signal mantA, mantB: std_logic_vector (23 downto 0);

--signals for step 1 (alignment)
signal expA1, expB1, exp1: unsigned(7 downto 0);
signal MantA1, MantB1: unsigned(23 downto 0);
signal diff1: integer range -256 to 256;

--signals for step 2 (addition)
signal sum2: unsigned(24 downto 0);
signal mantA2, mantB2: unsigned(23 downto 0);
signal mantA21, mantB21: unsigned(24 downto 0);
signal sign2: std_logic;

--signals for step 3 (normalization)
signal shift: unsigned(7 downto 0);
signal shiftsign: std_logic;
signal exp3: unsigned(7 downto 0);
signal sum3: unsigned(24 downto 0);
signal sum31: unsigned(25 downto 0);
signal sign3: std_logic;

--signals for step 4 (finalization)
signal sum4: std_logic_vector(22 downto 0);


begin

    --step 0
    initialization: process(A, B)
    begin
    
    	signA <= A(31);
    	signB <= B(31);
    	expA <= A(30 downto 23);
    	expB <= B(30 downto 23);
    	mantA <= '1'&A(22 downto 0);
    	mantB <= '1'&B(22 downto 0);
        
    	if expA = "00000000" then
    	    mantA <= '0'&A(22 downto 0);
    	end if;
    	
        if expB = "00000000" then
        	mantB <= '0'&B(22 downto 0);
        end if;
        
    end process;


	--step 1
	expA1 <= unsigned(expA);
	expB1 <= unsigned(expB);
    
	alignment: process(expB1, expA1, mantA, mantB, mantB1, mantA1, diff1)
	begin
        
        diff1 <= to_integer(expB1-expA1);
		exp1 <= expB1;
		mantA1 <= unsigned(mantA);
		mantB1 <= unsigned(mantB);
        
		if expA1 > expB1 then 
            diff1 <= to_integer(expA1-expB1);
			exp1 <= expA1;
            mantB1 <= shift_right(unsigned(MantB), diff1);
		else 
            mantA1 <= shift_right(unsigned(MantA), diff1);
		end if;
	
	end process;
    
    
	--step2
	addition: process(mantA1, mantB1, mantA21, mantB21, mantA2, mantB2,A, B)
	begin
		
        mantA2 <= mantA1;
    	mantB2 <= mantB1;
        sum2 <= ('0' & mantA2) + ('0' & mantB2);
        sign2 <= '0';
        
        if A(31) ='1' and B(31) ='0' then
        	
            if mantB2 > mantA2 then
        		sum2 <= ('0' & mantB2) - ('0' & mantA2);
                sign2 <= '0';
            else
            	sum2 <= ('0' & mantA2) - ('0' & mantB2);
                sign2 <= '1';
            end if;
            
        elsif A(31) ='0' and B(31) ='1' then
        	
            if mantB2 > mantA2 then
        		sum2 <= ('0' & mantB2) - ('0' & mantA2);
                sign2 <= '1';
            else
            	sum2 <= ('0' & mantA2) - ('0' & mantB2);
                sign2 <= '0';
            end if;
            
        elsif A(31) = '1' then       
        	sign2 <= '1';            
        end if;
        
	end process;


	--step3
	normalization: process(sum2, sum31, exp1, sign2, shift)
	begin
		
        sum3 <= sum2;
		sign3 <= sign2;
		shift <= "00000000";
		shiftsign <= '0';
        exp3<=exp1;

		if sum2(24) = '1' then
        --overflow
			sum3 <= shift_right(sum2, 1);
			shift <= "00000001";
			shiftsign <= '1';
         end if;
         
           --23rd bit not a '1'
            if sum2(23)/='1' and sum2(24)='0' then
            shift<= "00000001";
            if sum2(22)/='1' then
            shift<= "00000010";
            if sum2(21)/='1' then
            shift<= "00000011";
            if sum2(20)/='1' then
            shift<= "00000100";
            if sum2(19)/='1' then
            shift<= "00000101";
            if sum2(18)/='1' then
            shift<= "00000110";
            if sum2(17)/='1' then
            shift<= "00000111";
            if sum2(16)/='1' then
            shift<= "00001000";
            if sum2(15)/='1' then
            shift<= "00001001";
            if sum2(14)/='1' then
            shift<= "00001010";
            if sum2(13)/='1' then
            shift<= "00001011";
            if sum2(12)/='1' then
            shift<= "00001100";
            if sum2(11)/='1' then
            shift<= "00001101";
            if sum2(10)/='1' then
            shift<= "00001110";
            if sum2(9)/='1' then
            shift<= "00001111";
            if sum2(8)/='1' then
            shift<= "00010000";
            if sum2(7)/='1' then
            shift<= "00010001";
            if sum2(6)/='1' then
            shift<= "00010010";
            if sum2(5)/='1' then
            shift<= "00010011";
            if sum2(4)/='1' then
            shift<= "00010100";
            if sum2(3)/='1' then
            shift<= "00010101";
            if sum2(2)/='1' then
            shift<= "00010110";
            if sum2(1)/='1' then
            shift<= "00010111";
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            end if;
            
		if shift < exp1 then
            sum3 <= shift_left(sum2, TO_INTEGER(shift));
        else 
        	sum3<= shift_left(sum2, TO_INTEGER(shift-exp1));
        end if;
        
   end if;

		--mantissa right shifted	
    	if shiftsign = '0' then
        	exp3<= exp1;
            
        	if shift< exp1 then
				exp3 <= exp1 - shift;
             else 
             	exp3<="00000000";
                end if;
        --overflow
		else
			exp3 <= exp1 + shift;
		end if;

	end process;

	--step4
	finalization: process(sum3, sign3, exp3, sum4)
	begin
    
		sum4 <=std_logic_vector(sum3(22 downto 0));
		S <= sign3 & std_logic_vector(exp3) & sum4;
        
        if sum4 = "00000000000000000000000" and exp3/="11111111" then
        	S<= "00000000000000000000000000000000";
        end if;
        
        -- both are minus infinity
        if A="11111111100000000000000000000000" and B= "11111111100000000000000000000000" then
            	S<= "11111111100000000000000000000000";
        end if;
         
        -- positive + negative infinity
        if expA1 = "11111111" then
        
        	if expA1 = expB1 then
            
            	if A(31)/=B(31) then
                	S<="11111111100000000000000000000001";
                end if;
        	else
            	S<=A(31)&"1111111100000000000000000000000";
            end if;
            
        if expB1 = "11111111" then
        
        	if A(31) = B(31) then
        		S<=B(31)&"1111111100000000000000000000000";
        	else 
            	S<="11111111100000000000000000000001";
        	end if;
        end if;
        end if;
        
        
        
	end process;


end implementation;