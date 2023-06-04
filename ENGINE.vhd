LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ENGINE IS 
	PORT (
		CLK_IN 			: IN std_logic; -- clock de entrada
		Enable			: IN std_logic; -- PLAY / PAUSE
		MODO_DE_JOGO	: IN std_logic;
		Placar_IN		: IN INTEGER;
		Player_1 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Player_1_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 1
		Player_2_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 2
		STATE				: OUT std_logic_vector(7 DOWNTO 0);
		RESET				: OUT std_logic;
		SPAV_OUT			: OUT std_logic -- Enable do SPAV
        );
END ENGINE; -- fim da entidade

ARCHITECTURE rtl OF ENGINE IS -- arquitetura da UART_RX é: 

	TYPE ESTADO IS (IDLE, GAME_MODE, PLAYER1, PLAYER2, SPAV, WIN); 
	
	SIGNAL SM_ENGINE : ESTADO := IDLE; -- estado inativo/inicial da máquina de estados
	SIGNAL GAME_MODE_AUX: std_logic;
	SIGNAL Player_start, EN_SPAV : std_logic_vector(1 DOWNTO 0):= (OTHERS => '0');
	SIGNAL Placar1, Placar2, Placar_aux : INTEGER RANGE 0 TO 8 := 0;
	SIGNAL Player1_aux, Player2_aux : std_logic_vector(8 DOWNTO 0):= (OTHERS => '0');
	SIGNAL EN : std_logic;
	SIGNAL Jogada_Player1, Jogada_Player2	: std_logic;
	SIGNAL WIN1, WIN2, EMPATE : std_logic;
	
	COMPONENT WIN_TESTER IS 
	PORT (
		Player 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player
		Win_OUT 	: OUT std_logic
        );
	END COMPONENT;
	
	COMPONENT EMPATE_TESTER IS 
	PORT (
		Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Empate_OUT 	: OUT std_logic
        );
	END COMPONENT;
	
	BEGIN
	WIN_TESTER_1 : WIN_TESTER
	PORT MAP(Player1_aux, WIN1);
	WIN_TESTER_2 : WIN_TESTER
	PORT MAP(Player2_aux, WIN2);
	
	EMPATE_TESTER_1 : EMPATE_TESTER
	PORT MAP(Player1_aux, Player2_aux, EMPATE);
	
	Placar_aux <= Placar_IN;
	GAME_MODE_AUX <= MODO_DE_JOGO;
	
	EN <= Enable AND CLK_IN;
	Jogada_Player1 <= ((Player_1(0) XOR Player1_aux(0)) OR (Player_1(1) XOR Player1_aux(1)) OR (Player_1(2) XOR Player1_aux(2)) OR (Player_1(3) XOR Player1_aux(3)) OR (Player_1(4) XOR Player1_aux(4)) OR (Player_1(5) XOR Player1_aux(5)) OR (Player_1(6) XOR Player1_aux(6)) OR (Player_1(7) XOR Player1_aux(7)) OR (Player_1(8) XOR Player1_aux(8)));
	Jogada_Player2 <= ((Player_2(0) XOR Player2_aux(0)) OR (Player_2(1) XOR Player2_aux(1)) OR (Player_2(2) XOR Player2_aux(2)) OR (Player_2(3) XOR Player2_aux(3)) OR (Player_2(4) XOR Player2_aux(4)) OR (Player_2(5) XOR Player2_aux(5)) OR (Player_2(6) XOR Player2_aux(6)) OR (Player_2(7) XOR Player2_aux(7)) OR (Player_2(8) XOR Player2_aux(8)));
	
	
	PROCESS (CLK_IN, EN)
	BEGIN
	
		IF rising_edge(EN) THEN
			
			CASE SM_ENGINE IS -- definição do estado inicial da máquina de estados
			
				WHEN IDLE =>
					STATE <= "01101101";
					IF Player_1 = "000000000" AND Player_2 = "000000000" THEN
					Player1_aux <= "000000000";
					Player2_aux <= "000000000";
					Placar1 <= 0;
					Placar2 <= 0;
					RESET <= '1';
					SM_ENGINE <= GAME_MODE;
					ELSE
					Player1_aux <= "000000000";
					Player2_aux <= "000000000";
					SM_ENGINE <= IDLE;
					END IF;
					
				WHEN GAME_MODE =>
					STATE <= "01100101";
					RESET <= '1';
					IF GAME_MODE_AUX = '1' THEN
						EN_SPAV <= "00";
						IF Placar1 = 0 AND Placar2 = 0 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= PLAYER1;
						ELSIF Placar1 >= Placar2 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= PLAYER2;
						ELSIF Placar1 < Placar2 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= PLAYER1;
						END IF;
					ELSIF GAME_MODE_AUX = '0' THEN
						EN_SPAV <= "10";
						IF Placar1 = 0 AND Placar2 = 0 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= SPAV;
						ELSIF Placar1 >= Placar2 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= PLAYER2;
						ELSIF Placar1 < Placar2 THEN
							Player1_aux <= "000000000";
							Player2_aux <= "000000000";
							SM_ENGINE <= SPAV;
						END IF;
					
					END IF;
					
				WHEN PLAYER1 =>
				STATE <= "01000011";
				RESET <= '0';
					IF Jogada_Player1 = '1' THEN
					Player_start <= "01";
					Player1_aux <= Player_1 OR Player1_aux;
					SM_ENGINE <= WIN;
					ELSE
					SM_ENGINE <= PLAYER1;
					END IF;
				
				WHEN PLAYER2 =>
				STATE <= "01010000";
				RESET <= '0';
					IF Jogada_Player2 = '1' THEN
					Player_start <= "10";
					Player2_aux <= Player_2 OR Player2_aux;
					SM_ENGINE <= WIN;
					ELSE
					SM_ENGINE <= PLAYER2;
					END IF;
					
				WHEN SPAV =>
				STATE <= "01010011";
				RESET <= '0';
					EN_SPAV(1) <= '1';
					IF Jogada_Player1 = '1' THEN
					Player_start <= "11";
					Player1_aux <= Player_1 OR Player1_aux;
					EN_SPAV(1) <= '0';
					SM_ENGINE <= WIN;
					ELSE
					SM_ENGINE <= SPAV;
					END IF;
				
				WHEN WIN =>
				STATE <= "01000010";
				RESET <= '0';
					IF WIN1 = '1' AND WIN2 = '0' THEN
						Placar1 <= Placar1 + 1;
						IF Placar1 = Placar_aux THEN
							SM_ENGINE <= IDLE;
						ELSE
							SM_ENGINE <= GAME_MODE;
						END IF;
					ELSIF WIN2 = '1' AND WIN1 = '0' THEN
						Placar2 <= Placar2 + 1;
						IF Placar2 = Placar_aux THEN
							SM_ENGINE <= IDLE;
						ELSE
							SM_ENGINE <= GAME_MODE;
						END IF;
					ELSIF EMPATE = '1' THEN
						Placar1 <= Placar1;
						Placar2 <= Placar2;
						SM_ENGINE <= GAME_MODE;
					ELSE
						IF Player_start = "01" OR Player_start = "11" THEN
							SM_ENGINE <= PLAYER2;
						ELSIF Player_start = "10" THEN
							IF EN_SPAV(0) = '0' THEN
								SM_ENGINE <= PLAYER1;
							ELSIF EN_SPAV(0) = '1' THEN
								SM_ENGINE <= SPAV;
							END IF;
						END IF;
					END IF;
            END CASE;
		Player_1_OUT <= Player1_aux;
		Player_2_OUT <= Player2_aux;
		SPAV_OUT <= EN_SPAV(1);
		END IF;
	END PROCESS;
END ARCHITECTURE; 