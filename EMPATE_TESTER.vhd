LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY EMPATE_TESTER IS 
	PORT (
		Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Empate_OUT 	: OUT std_logic
        );
END EMPATE_TESTER;

ARCHITECTURE rtl OF EMPATE_TESTER IS
	SIGNAL Tabuleiro : std_logic_vector(8 DOWNTO 0);
	BEGIN
	Tabuleiro(0) <= Player_1(0) OR Player_2(0);
	Tabuleiro(1) <= Player_1(1) OR Player_2(1);
	Tabuleiro(2) <= Player_1(2) OR Player_2(2);
	Tabuleiro(3) <= Player_1(3) OR Player_2(3);
	Tabuleiro(4) <= Player_1(4) OR Player_2(4);
	Tabuleiro(5) <= Player_1(5) OR Player_2(5);
	Tabuleiro(6) <= Player_1(6) OR Player_2(6);
	Tabuleiro(7) <= Player_1(7) OR Player_2(7);
	Tabuleiro(8) <= Player_1(8) OR Player_2(8);
	
	Empate_OUT <= Tabuleiro(0) AND Tabuleiro(1) AND Tabuleiro(2) AND Tabuleiro(3) AND Tabuleiro(5) AND Tabuleiro(6) AND Tabuleiro(7) AND Tabuleiro(8);
END ARCHITECTURE;