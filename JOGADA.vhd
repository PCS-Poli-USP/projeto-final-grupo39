LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY JOGADA IS 
	PORT (
		Player_1 		: IN std_logic_vector(8 DOWNTO 0);
		Player1_aux 	: IN std_logic_vector(8 DOWNTO 0);
		MOVE				: OUT std_logic
        );
END JOGADA; -- fim da entidade

ARCHITECTURE rtl OF JOGADA IS 
	BEGIN
		MOVE	<= ((Player_1(0) XOR Player1_aux(0)) OR (Player_1(1) XOR Player1_aux(1)) OR (Player_1(2) XOR Player1_aux(2)) OR (Player_1(3) XOR Player1_aux(3)) OR (Player_1(4) XOR Player1_aux(4)) OR (Player_1(5) XOR Player1_aux(5)) OR (Player_1(6) XOR Player1_aux(6)) OR (Player_1(7) XOR Player1_aux(7)) OR (Player_1(8) XOR Player1_aux(8)));
END ARCHITECTURE;		