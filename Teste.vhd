	
	LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;

	ENTITY Teste IS
		PORT (
		clock_i 					 		: IN std_logic;
		GAME_MODE_IN 					: IN std_logic;
		PLAY								: IN std_logic;
		Bot_1								: IN std_logic;
		Bot_2								: IN std_logic;
		XO									: OUT std_logic;
		Display1							: OUT std_logic_vector(7 DOWNTO 0);
		--Player_1							: IN std_logic_vector(8 DOWNTO 0);
		--Player_2							: IN std_logic_vector(8 DOWNTO 0);
		
		R, G, B							: OUT std_logic_vector(3 DOWNTO 0);
		HSYNC, VSYNC					: OUT std_logic;
		Player1Preview, Player2Preview, Player1OUT, Player2OUT : OUT std_logic_vector(8 DOWNTO 0)
        
		);
	END ENTITY Teste;


	ARCHITECTURE RTL OF Teste IS

		SIGNAL SPAV_CONTROL, XO_CONTROL, clock_i_aux, RESET, XO_aux, Preview_EN, TELA_WINX_aux, TELA_WINO_aux	: std_logic; -- sinal que representa o validador  de bit
		SIGNAL Player1_CTRL, Player2_CTRL, SPAV_CTRL								   			: std_logic_vector(8 DOWNTO 0); -- sinal que representa o byte com uma palavra armazenada
		SIGNAL Player1_DISPLAY, Player2_DISPLAY	 : std_logic_vector(8 DOWNTO 0); -- sinais que vão conectar partes das palavras que adquirimos na máquina de estados a entidade que converte para o display 7 segmentos
		SIGNAL Player_1, Player_2, Tabuleiro_aux						: std_logic_vector(8 DOWNTO 0);
		SIGNAL Player_1_Preview, Player_2_Preview, Player_1_Preview_aux, Player_2_Preview_aux	: std_logic_vector(8 DOWNTO 0);
		SIGNAL STATE_aux															: std_logic_vector(7 DOWNTO 0);
		SIGNAL Placar1, Placar2 	: std_logic_vector(9 DOWNTO 0);
		SIGNAL LINHA_aux : INTEGER RANGE 0 TO 350:=0;
		
		COMPONENT CONTROLADOR_VGA IS
			PORT(
				CLK				: IN std_logic;  -- Clock FPGA.
				RST				: IN std_logic;  -- RESET.
				HSYNC 			: OUT std_logic; --Sync Horizontal 
				VSYNC 			: OUT std_logic; --Sync Vertical
				R					: OUT std_logic_vector(3 downto 0); --bits de R (1111 = max)
				G					: OUT std_logic_vector(3 downto 0); --bits de G (1111 = max)
				B	   			: OUT std_logic_vector(3 downto 0); --bits de B (1111 = max)
				Player_1_IN		: IN std_logic_vector(8 DOWNTO 0); 
				Player_2_IN		: IN std_logic_vector(8 DOWNTO 0); 
				Player_1_Pre	: IN std_logic_vector(8 DOWNTO 0); 
				Player_2_Pre	: IN std_logic_vector(8 DOWNTO 0);
				Placar1_IN 		: IN	std_logic_vector(9 DOWNTO 0);
				Placar2_IN 		: IN	std_logic_vector(9 DOWNTO 0);
				TELA_WINX_IN	: IN std_logic;
				TELA_WINO_IN	: IN std_logic;
				LINHA_IN			: IN integer RANGE 0 TO 350
				);
		END COMPONENT;
		
		COMPONENT DivisorDeClock is
			 generic(
				 freq_clock_in : integer := 50_000_000;
				 freq_clock_out : integer := 256
				 );
			 port(
				 clock_in: in std_logic;
				clock_out: out std_logic
				 );
		END COMPONENT;


		COMPONENT SPAV IS 
			PORT (
				CLK_IN 		: IN std_logic; -- clock de entrada
				Enable		: IN std_logic; -- Enable do SPAV
				Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
				SPAV_IN 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas anteriores do SPAV
				SPAV_OUT 	: OUT std_logic_vector(8 DOWNTO 0) --  saída da posição das jogadas do SPAV
				  );
		END COMPONENT;
		
		COMPONENT SPAV_v2 IS 
			PORT (
				CLK_IN 		: IN std_logic; -- clock de entrada
				Enable		: IN std_logic; -- Enable do SPAV
				RESET			: IN std_logic;
				Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
				SPAV_IN 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas anteriores do SPAV
				SPAV_OUT_o 	: OUT std_logic_vector(8 DOWNTO 0) --  saída da posição das jogadas do SPAV
				  );
		END COMPONENT;
		
		COMPONENT ENGINE IS 
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
		XO					: OUT std_logic;
		Preview_EN		: OUT std_logic;
		TELA_WINX_OUT	: OUT std_logic;
		TELA_WINO_OUT	: OUT std_logic;
		SPAV_OUT			: OUT std_logic -- Enable do SPAV
        );
		END COMPONENT;
		
		COMPONENT CONTROLE IS 
			PORT (
				CLK_IN 			: IN std_logic; -- clock de entrada
				RESET				: IN std_logic;
				--BOT_UP			: IN std_logic;
				--BOT_RIGHT		: IN std_logic;
				BOT_MOVE			: IN std_logic;
				BOT_CONFIRM		: IN std_logic;
				SPAV_CTRL_IN 	: IN std_logic;
				XO_IN				: IN std_logic;
				Player_1_IN		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
				Player_2_IN		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
				Player_1_Pre	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 1
				Player_2_Pre	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 2
				Player_1_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 1
				Player_2_OUT 	: OUT std_logic_vector(8 DOWNTO 0); -- saida da posição das jogadas do Player 2
				XO					: OUT std_logic -- X = 1 | O = 0
				  );
		END COMPONENT;

		COMPONENT TABULEIRO IS 
			PORT (
				Player_1 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
				Player_2 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 2
				Tabuleiro_OUT 	: OUT std_logic_vector(8 DOWNTO 0)
				  );
		END COMPONENT;
		
		COMPONENT DISPLAY IS
			  PORT (
				 input: in   std_logic_vector(7 downto 0); -- ASCII 8 bits
				 output: out std_logic_vector(7 downto 0)  -- ponto + abcdefg
			  );
		END COMPONENT;
		
		
			
	BEGIN
		Player1_CTRL <= Player_1;
		
		WITH GAME_MODE_IN SELECT Player2_CTRL <=
			Player_2 	WHEN 		'1', -- PvP
			SPAV_CTRL 	WHEN OTHERS;  -- PvE
			
		WITH Preview_EN SELECT Player_1_Preview_aux <=
			Player_1_Preview 	WHEN 		'1',
			"000000000" 	WHEN OTHERS;
		
		WITH Preview_EN SELECT Player_2_Preview_aux <=
			Player_2_Preview 	WHEN 		'1',
			"000000000" 	WHEN OTHERS;
			
		CLOCK_1 : DivisorDeClock
		PORT MAP(clock_i, clock_i_aux);
		
		SPAV_1 : SPAV_v2
		PORT MAP(clock_i_aux, SPAV_CONTROL, RESET, Player1_DISPLAY, Player2_DISPLAY, SPAV_CTRL);
		
		ENGINE_1 : ENGINE
		PORT MAP(clock_i_aux, PLAY, GAME_MODE_IN, "0000000100", Player1_CTRL, Player2_CTRL, Player1_DISPLAY, Player2_DISPLAY, STATE_aux, Placar1, Placar2, LINHA_aux, RESET, XO_aux, Preview_EN, TELA_WINX_aux, TELA_WINO_aux, SPAV_CONTROL);
		
		CONTROLE_1 : CONTROLE
		PORT MAP(clock_i_aux, RESET, Bot_2, Bot_1, GAME_MODE_IN, XO_aux, Player1_DISPLAY, Player2_DISPLAY, Player_1_Preview, Player_2_Preview, Player_1, Player_2, XO_CONTROL);
		
		--TABULEIRO_1 : TABULEIRO
		--PORT MAP(Player1_DISPLAY, Player2_DISPLAY, Tabuleiro_aux);
		
		DISPLAY_1 : DISPLAY
		PORT MAP(STATE_aux, Display1);
		
		Player1Preview <= Player_1_Preview;
		Player2Preview <= SPAV_CTRL;
		--Player2Preview <= Player1_CTRL OR Player2_CTRL;
		XO <= SPAV_CONTROL;
		-- Criação de três displays 7 segmentos que recebem como entrada os bits separados do vetor de palavras e tem como saída o código de quais segmentos do display devem acender para cada código
		-- lembrar que esses códigos precisam ser invertidos (ler teoria para entender o porquê)


		VGA : CONTROLADOR_VGA
		PORT MAP(clock_i, '0', HSYNC, VSYNC, R, G, B, Player1_DISPLAY, Player2_DISPLAY, Player_1_Preview_aux, Player_2_Preview_aux, Placar1, Placar2, TELA_WINX_aux, TELA_WINO_aux, LINHA_aux);

	END architecture;