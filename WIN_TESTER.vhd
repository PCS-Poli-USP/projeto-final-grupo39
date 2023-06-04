LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY WIN_TESTER IS 
	PORT (
		Player 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player
		Win_OUT 	: OUT std_logic
        );
END WIN_TESTER;

ARCHITECTURE rtl OF WIN_TESTER IS
	BEGIN
	Win_OUT <= 	(Player(0) AND Player(1) AND Player(2)) OR 
					(Player(3) AND Player(4) AND Player(5)) OR
					(Player(6) AND Player(7) AND Player(8)) OR 
					(Player(0) AND Player(3) AND Player(6)) OR 
					(Player(1) AND Player(4) AND Player(7)) OR 
					(Player(2) AND Player(5) AND Player(8)) OR 
					(Player(0) AND Player(4) AND Player(8)) OR 
					(Player(2) AND Player(4) AND Player(6)); 
END ARCHITECTURE;