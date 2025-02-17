LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY TABULEIRO IS 
	PORT (
		Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Tabuleiro_OUT 	: OUT std_logic_vector(8 DOWNTO 0)
        );
END TABULEIRO;

ARCHITECTURE rtl OF TABULEIRO IS
	BEGIN
	Tabuleiro_OUT(0) <= Player_1(0) OR Player_2(0);
	Tabuleiro_OUT(1) <= Player_1(1) OR Player_2(1);
	Tabuleiro_OUT(2) <= Player_1(2) OR Player_2(2);
	Tabuleiro_OUT(3) <= Player_1(3) OR Player_2(3);
	Tabuleiro_OUT(4) <= Player_1(4) OR Player_2(4);
	Tabuleiro_OUT(5) <= Player_1(5) OR Player_2(5);
	Tabuleiro_OUT(6) <= Player_1(6) OR Player_2(6);
	Tabuleiro_OUT(7) <= Player_1(7) OR Player_2(7);
	Tabuleiro_OUT(8) <= Player_1(8) OR Player_2(8);
END ARCHITECTURE;