LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY DEBOUNCE IS
	PORT (
		CLK: IN std_logic;
		DATA_IN : IN std_logic;
		DATA_OUT : OUT std_logic
		);
END DEBOUNCE ;
 
ARCHITECTURE Behavioral OF DEBOUNCE IS
 
SIGNAL OP1, OP2, OP3: std_logic;
 
BEGIN
 
	PROCESS(CLK)
		BEGIN
			If rising_edge(CLK) THEN
				OP1 <= DATA_IN;
				OP2 <= OP1;
				OP3 <= OP2;
			END IF;
 
END PROCESS;
DATA_OUT <= OP1 and OP2 and OP3;
 
end Behavioral;
