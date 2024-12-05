LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CONTROLE IS 
	PORT (
		CLK_IN 			: IN std_logic; -- clock de entrada
		RESET 			: IN std_logic;
		--BOT_UP			: IN std_logic;
		--BOT_RIGHT		: IN std_logic;
		BOT_MOVE			: IN std_logic;
		BOT_CONFIRM		: IN std_logic;
		SPAV_CTRL_IN 	: IN std_logic;
		XO_IN				: IN std_logic;
		Player_1_IN		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2_IN		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Player_1_Pre	: OUT std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		Player_2_Pre	: OUT std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
		Player_1_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 1
		Player_2_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 2
		XO					: OUT std_logic -- X = 1 | O = 0
        );
END CONTROLE; -- fim da entidade

ARCHITECTURE rtl OF CONTROLE IS

	SIGNAL	Player_1_Pre_aux	: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- entrada da posição das jogadas do Player 1
	SIGNAL	Player_2_Pre_aux	: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- entrada da posição das jogadas do Player 2
	SIGNAL	Player_1_OUT_aux 	: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- saida da posição das jogadas do Player 1
	SIGNAL	Player_2_OUT_aux 	: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- saida da posição das jogadas do Player 2
	SIGNAL	Player_1_aux 		: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- saida da posição das jogadas do Player 1
	SIGNAL	Player_2_aux 		: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- saida da posição das jogadas do Player 2
	SIGNAL	Tabuleiro_aux 		: std_logic_vector(8 DOWNTO 0):= (OTHERS => '0'); -- saida da posição das jogadas do Player 2
	SIGNAL	XO_aux				: std_logic := '1';
	SIGNAL	BOT_UP_aux, BOT_RIGHT_aux, BOT_CONFIRM_aux, BOT_MOVE_aux, RESET_aux	: std_logic;
	SIGNAL 	Counter, Counter_UP, Counter_RIGHT		 		: INTEGER RANGE 0 TO 10 := 0;	
	SIGNAL 	EN : std_logic := '1';
	
	COMPONENT TABULEIRO IS 
		PORT (
			Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
			Player_2 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
			Tabuleiro_OUT 	: OUT std_logic_vector(8 DOWNTO 0)
			  );
	END COMPONENT;

	BEGIN
	EN <= '1';
	--BOT_UP_aux <= NOT BOT_UP;
	--BOT_RIGHT_aux <= NOT BOT_RIGHT;
	BOT_CONFIRM_aux <= NOT BOT_CONFIRM;
	BOT_MOVE_aux <= NOT BOT_MOVE;
	RESET_aux <= RESET OR CLK_IN;
	
	TABULEIRO_1 : TABULEIRO
	PORT MAP(Player_1_IN, Player_2_IN, Tabuleiro_aux);
	
	MOVEMENT: PROCESS (BOT_MOVE_aux, RESET)
	BEGIN
		IF RESET = '1' THEN
			Player_1_Pre_aux <= "000000000";
			Player_2_Pre_aux <= "000000000";
			Counter <= 0;
		ELSIF (EN = '1') THEN
			IF Counter < 9 THEN
				IF rising_edge(BOT_MOVE_aux) THEN
					Counter <= Counter + 1;
				ELSE
					Counter <= Counter;
				END IF;
			ELSE
				Counter <= 0;
			END IF;
			IF RESET = '0' THEN
				IF XO_IN = '1' THEN
					Player_1_Pre_aux <= "000000000";
					Player_1_Pre_aux(Counter) <= '1';
					Player_2_Pre_aux <= "000000000";
				ELSIF XO_IN = '0' THEN
					Player_2_Pre_aux <= "000000000";
					Player_2_Pre_aux(Counter) <= '1';
					Player_1_Pre_aux <= "000000000";
				END IF;
			ELSE
				Counter <= 0;
				Player_1_Pre_aux <= "000000000";
				Player_2_Pre_aux <= "000000000";
			END IF;
		END IF;
	END PROCESS;
	
	CONFIRM: PROCESS (BOT_CONFIRM_aux, RESET)
	BEGIN
	
		IF RESET = '1' THEN
			Player_1_OUT_aux <= "000000000";
			Player_2_OUT_aux <= "000000000";
		ELSIF (rising_edge(BOT_CONFIRM_aux) AND EN = '1') THEN
			IF Tabuleiro_aux(Counter) = '0' THEN
					IF XO_IN = '1' THEN
						Player_1_OUT_aux <= "000000000";
						Player_1_OUT_aux <= Player_1_Pre_aux;
						XO_aux <= NOT XO_aux;
					ELSIF XO_IN = '0' THEN
						Player_2_OUT_aux <= "000000000";
						Player_2_OUT_aux <= Player_2_Pre_aux;
						XO_aux <= NOT XO_aux;
					END IF;
			ELSE
				Player_1_OUT_aux <= Player_1_OUT_aux;
				Player_2_OUT_aux <= Player_2_OUT_aux;
				XO_aux <= XO_aux;
			END IF;
			IF RESET = '1' THEN
			Player_1_OUT_aux <= "000000000";
			Player_2_OUT_aux <= "000000000";
			END IF;
		END IF;
	END PROCESS;
	
	print: PROCESS (RESET_aux, RESET)
	BEGIN
		IF RESET = '1' THEN
			Player_1_aux <= "000000000";
			Player_2_aux <= "000000000";
			Player_1_OUT <= Player_1_aux;
			Player_2_OUT <= Player_2_aux;
		ELSIF rising_edge(RESET_aux) THEN
			IF RESET = '1' THEN
				Player_1_aux <= "000000000";
				Player_2_aux <= "000000000";
			ELSE
				Player_1_aux <= Player_1_OUT_aux OR Player_1_aux;
				Player_2_aux <= Player_2_OUT_aux OR Player_2_aux;
				IF XO_IN = '1' THEN -- X
					Player_1_Pre <= Player_1_Pre_aux;
					Player_2_Pre <= "000000000";
					XO <= '1';
				ELSIF XO_IN = '0' THEN -- O
					Player_2_Pre <= Player_2_Pre_aux;
					Player_1_Pre <= "000000000";
					XO <= '0';
				END IF;
			END IF;
			Player_1_OUT <= Player_1_aux;
			Player_2_OUT <= Player_2_aux;
		END IF;
	END PROCESS print;
END ARCHITECTURE; 