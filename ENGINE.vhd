LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ENGINE IS 
	PORT (
		CLK_IN 			: IN std_logic; -- clock de entrada
		Enable			: IN std_logic; -- PLAY / PAUSE
		MODO_DE_JOGO	: IN std_logic;
		Placar_IN		: IN std_logic_vector(9 DOWNTO 0);
		Player_1 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Player_1_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 1
		Player_2_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 2
		STATE				: OUT std_logic_vector(7 DOWNTO 0);
		Placar1_OUT 	: OUT	std_logic_vector(9 DOWNTO 0);
		Placar2_OUT 	: OUT	std_logic_vector(9 DOWNTO 0);
		LINHA_OUT		: OUT integer RANGE 0 TO 350;
		RESET_OUT		: OUT std_logic;
		SPAV_OUT			: OUT std_logic -- Enable do SPAV
        );
END ENGINE; -- fim da entidade

ARCHITECTURE rtl OF ENGINE IS

	TYPE ESTADO IS (IDLE, GAME_MODE, PLAYER1, PLAYER2, SPAV, WIN, LINHA); 
	
	SIGNAL SM_ENGINE : ESTADO := IDLE; -- estado inativo/inicial da máquina de estados
	SIGNAL GAME_MODE_AUX: std_logic;
	SIGNAL Player_start, EN_SPAV : std_logic_vector(1 DOWNTO 0):= (OTHERS => '0');
	SIGNAL Placar1, Placar2, Placar_aux : std_logic_vector(9 DOWNTO 0):= (OTHERS => '0');
	SIGNAL Player1_aux, Player2_aux : std_logic_vector(8 DOWNTO 0):= (OTHERS => '0');
	SIGNAL EN : std_logic;
	SIGNAL Jogada_Player1, Jogada_Player2, Player1_rst, Player2_rst	: std_logic;
	SIGNAL WIN1, WIN2, EMPATE, RESET : std_logic;
	SIGNAL LINHA_aux : INTEGER RANGE 0 TO 350:=0;
	
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
	
	RESET_OUT <= RESET;
	Placar_aux <= Placar_IN;
	GAME_MODE_AUX <= MODO_DE_JOGO;
	EN_SPAV(0) <= NOT GAME_MODE_AUX;
	EN <= Enable AND CLK_IN;
	Jogada_Player1 <= ((Player_1(0) XOR Player1_aux(0)) OR (Player_1(1) XOR Player1_aux(1)) OR (Player_1(2) XOR Player1_aux(2)) OR (Player_1(3) XOR Player1_aux(3)) OR (Player_1(4) XOR Player1_aux(4)) OR (Player_1(5) XOR Player1_aux(5)) OR (Player_1(6) XOR Player1_aux(6)) OR (Player_1(7) XOR Player1_aux(7)) OR (Player_1(8) XOR Player1_aux(8)));
	Jogada_Player2 <= ((Player_2(0) XOR Player2_aux(0)) OR (Player_2(1) XOR Player2_aux(1)) OR (Player_2(2) XOR Player2_aux(2)) OR (Player_2(3) XOR Player2_aux(3)) OR (Player_2(4) XOR Player2_aux(4)) OR (Player_2(5) XOR Player2_aux(5)) OR (Player_2(6) XOR Player2_aux(6)) OR (Player_2(7) XOR Player2_aux(7)) OR (Player_2(8) XOR Player2_aux(8)));
	Player1_rst <= (Player_1(0) OR Player_1(1) OR Player_1(2) OR Player_1(3) OR Player_1(4) OR Player_1(5) OR Player_1(6) OR Player_1(7) OR Player_1(8));
	Player2_rst <= (Player_2(0) OR Player_2(1) OR Player_2(2) OR Player_2(3) OR Player_2(4) OR Player_2(5) OR Player_2(6) OR Player_2(7) OR Player_2(8));
	
	PROCESS (EN, Jogada_Player1, Jogada_Player2)
	BEGIN
	
		IF rising_edge(EN) THEN
			Player_1_OUT <= Player1_aux;
			Player_2_OUT <= Player2_aux;
			Placar1_OUT <= Placar1;
			Placar2_OUT <= Placar2;
			SPAV_OUT <= EN_SPAV(1);
			
			CASE SM_ENGINE IS -- definição do estado inicial da máquina de estados
			
				WHEN IDLE =>
					STATE <= "01001001";
					IF Player1_rst = '0' AND Player2_rst = '0' THEN
					Player1_aux <= "000000000";
					Player2_aux <= "000000000";
					Player_start <= "00";
					Placar1 <= "0000000001";
					Placar2 <= "0000000001";
					RESET <= '0';
					SM_ENGINE <= GAME_MODE;
					ELSE
					Player1_aux <= "000000000";
					Player2_aux <= "000000000";
					RESET <= '1';
					SM_ENGINE <= IDLE;
					END IF;
					
				WHEN GAME_MODE =>
					STATE <= "01000111";
					Player1_aux <= Player_1;
					Player2_aux <= Player_2;
					IF Player1_rst = '0' AND Player2_rst = '0' THEN
					RESET <= '0';
					STATE <= "01010111";
						IF GAME_MODE_AUX = '1' THEN
							IF Player_start = "01" THEN
								SM_ENGINE <= PLAYER2;
							ELSE
								SM_ENGINE <= PLAYER1;
							END IF;
						ELSIF GAME_MODE_AUX = '0' THEN
							IF Player_start = "01" THEN
								SM_ENGINE <= SPAV;
							ELSE
								SM_ENGINE <= PLAYER1;
							END IF;
						END IF;
					ELSE
						Player1_aux <= "000000000";
						Player2_aux <= "000000000";
						RESET <= NOT RESET;
						SM_ENGINE <= GAME_MODE;
					END IF;
					
				WHEN PLAYER1 =>
				RESET <= '0';
				Player_1_OUT <= Player1_aux;
				Player_2_OUT <= Player2_aux;
				EN_SPAV(1) <= '0';
				STATE <= "01000011";
					IF Jogada_Player1 = '1' THEN
					Player_start <= "01";
					Player1_aux <= Player_1 OR Player1_aux;
					SM_ENGINE <= WIN;
					ELSE
					SM_ENGINE <= PLAYER1;
					END IF;
				
				WHEN PLAYER2 =>
				RESET <= '0';
				Player_1_OUT <= Player1_aux;
				Player_2_OUT <= Player2_aux;
				EN_SPAV(1) <= '0';
				STATE <= "01010000";
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
					IF Jogada_Player2 = '1' THEN
					EN_SPAV(1) <= '0';
					Player_start <= "11";
					Player2_aux <= Player_2 OR Player2_aux;
					SM_ENGINE <= WIN;
					ELSE
					EN_SPAV(1) <= NOT EN_SPAV(1);
					SM_ENGINE <= SPAV;
					END IF;
				
				WHEN WIN =>

				STATE <= "01000010";
				RESET <= '0';
					IF WIN1 = '1' AND WIN2 = '0' THEN
						Placar1 <= Placar1(8 DOWNTO 0) & '0';
						IF Placar1 = Placar_aux THEN
							SM_ENGINE <= IDLE;
						ELSE
							SM_ENGINE <= LINHA;
						END IF;
					ELSIF WIN2 = '1' AND WIN1 = '0' THEN
						Placar2 <= Placar2(8 DOWNTO 0) & '0';
						IF Placar2 = Placar_aux THEN
							SM_ENGINE <= IDLE;
						ELSE
							SM_ENGINE <= LINHA;
						END IF;
					ELSIF EMPATE = '1' THEN
						Placar1 <= Placar1;
						Placar2 <= Placar2;
						SM_ENGINE <= GAME_MODE;
					ELSE
						IF Player_start = "01" THEN
							IF EN_SPAV(0) = '1' THEN
								SM_ENGINE <= SPAV;
							ELSIF EN_SPAV(0) = '0' THEN
								SM_ENGINE <= PLAYER2;
							END IF;
						ELSE
								SM_ENGINE <= PLAYER1;
						END IF;
					END IF;
				
				WHEN LINHA =>
				STATE <= "01011111";
				RESET <= '0';
					IF LINHA_AUX <= 350 THEN
						LINHA_AUX <= LINHA_AUX + 1;
						SM_ENGINE <= LINHA;
					ELSE
						LINHA_AUX <= 0;
						SM_ENGINE <= GAME_MODE;
					END IF;
					
            END CASE;
		END IF;
	END PROCESS;
END ARCHITECTURE; 