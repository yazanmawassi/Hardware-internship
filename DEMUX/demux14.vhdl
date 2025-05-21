LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        I_n : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        Y0 : OUT std_logic_vector(2 DOWNTO 0);
        Y1 : OUT std_logic_vector(2 DOWNTO 0);
        Y2 : OUT std_logic_vector(2 DOWNTO 0);
        Y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS

signal sel_not0: std_logic;
signal sel_not1: std_logic;

COMPONENT and_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
            and_output : OUT std_logic
			);
    END COMPONENT;
    
    COMPONENT not_gate IS
        PORT (input1    : IN std_logic;
             not_output : OUT std_logic);
    END COMPONENT;
begin	
	demu_and_assignment :for i in 0 to 2 generate
	   and_output01: and_gate port map(input1 => I_n(i), input2 => sel_not0, input3 => sel_not1,and_output => Y0(i));
	   and_output02: and_gate port map(input1 => I_n(i), input2 => sel(0), input3 => sel_not1,and_output => Y1(i));
       and_output03: and_gate port map(input1 => I_n(i), input2 => sel_not0, input3 => sel(1),and_output => Y2(i));
	   and_output04: and_gate port map(input1 => I_n(i), input2 => sel(0), input3 => sel(1),and_output => Y3(i));
	   
	end generate demu_and_assignment;
	
	not_sel5: not_gate port map(input1 => sel(0), not_output => sel_not0);
    not_sel6: not_gate port map(input1 => sel(1), not_output => sel_not1);
	   
	   
END rtl;

