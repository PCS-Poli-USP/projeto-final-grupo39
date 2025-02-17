LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SPAV_v2 IS 
	PORT (
		CLK_IN 		: IN std_logic; -- clock de entrada
		Enable		: IN std_logic; -- Enable do SPAV
		RESET			: IN std_logic;
		Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		SPAV_IN 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas anteriores do SPAV
		SPAV_OUT_o 	: OUT std_logic_vector(8 DOWNTO 0) --  saída da posição das jogadas do SPAV
        );
END SPAV_v2; -- fim da entidade

ARCHITECTURE rtl OF SPAV_v2 IS -- arquitetura da UART_RX é: 

	SIGNAL EN : std_logic:= '0';
	SIGNAL SPAV_OUT : std_logic_vector(8 DOWNTO 0):= (OTHERS => '0');
	
	BEGIN
	
	EN <= Enable;
	
	PROCESS (EN, RESET)
	BEGIN
	IF RESET = '1' THEN
		SPAV_OUT <= "000000000";
		SPAV_OUT_o <= SPAV_OUT;
	ELSIF rising_edge(EN) THEN
		--===========--
		--FINALIZAÇÃO--
		--===========--
		IF (( SPAV_IN(0)='0' AND Player_1(0)='0' ) AND (( SPAV_IN(1)='1' AND SPAV_IN(2)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(8)='1' ))) THEN
			SPAV_OUT(0)<='1';
		ELSIF (( SPAV_IN(1)='0' AND Player_1(1)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(2)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(7)='1' )) ) THEN
			SPAV_OUT(1)<='1';
		ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(1)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(5)='1' AND SPAV_IN(8)='1' )) ) THEN
			SPAV_OUT(2)<='1';
		ELSIF (( SPAV_IN(3)='0' AND Player_1(3)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(5)='1' )) ) THEN
			SPAV_OUT(3)<='1';
		ELSIF (( SPAV_IN(4)='0' AND Player_1(4)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(1)='1' AND SPAV_IN(7)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(5)='1' )) ) THEN
			SPAV_OUT(4)<='1';
		ELSIF (( SPAV_IN(5)='0' AND Player_1(5)='0' ) AND (( SPAV_IN(2)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(4)='1' )) ) THEN
			SPAV_OUT(5)<='1';
		ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(3)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(7)='1' AND SPAV_IN(8)='1' )) ) THEN
			SPAV_OUT(6)<='1';
		ELSIF (( SPAV_IN(7)='0' AND Player_1(7)='0' ) AND (( SPAV_IN(1)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(6)='1' AND SPAV_IN(8)='1' )) ) THEN
			SPAV_OUT(7)<='1';
		ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(5)='1' ) OR ( SPAV_IN(6)='1' AND SPAV_IN(7)='1' )) ) THEN
			SPAV_OUT(8)<='1';
		ELSE
			--==========--
			-- BLOQUEIO --
			--==========--				
			IF (( SPAV_IN(0)='0' AND Player_1(0)='0' ) AND (( Player_1(1)='1' AND Player_1(2)='1' ) OR ( Player_1(3)='1' AND Player_1(6)='1' ) OR ( Player_1(4)='1' AND Player_1(8)='1' )) ) THEN
				SPAV_OUT(0)<='1';
			ELSIF (( SPAV_IN(1)='0' AND Player_1(1)='0' ) AND (( Player_1(0)='1' AND Player_1(2)='1' ) OR ( Player_1(4)='1' AND Player_1(7)='1' )) ) THEN
				SPAV_OUT(1)<='1';
			ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0' ) AND (( Player_1(0)='1' AND Player_1(1)='1' ) OR ( Player_1(4)='1' AND Player_1(6)='1' ) OR ( Player_1(5)='1' AND Player_1(8)='1' )) ) THEN
				SPAV_OUT(2)<='1';
			ELSIF (( SPAV_IN(3)='0' AND Player_1(3)='0' ) AND (( Player_1(0)='1' AND Player_1(6)='1' ) OR ( Player_1(4)='1' AND Player_1(5)='1' )) ) THEN
				SPAV_OUT(3)<='1';
			ELSIF (( SPAV_IN(4)='0' AND Player_1(4)='0' ) AND (( Player_1(0)='1' AND Player_1(8)='1' ) OR ( Player_1(2)='1' AND Player_1(6)='1' ) OR ( Player_1(1)='1' AND Player_1(7)='1' ) OR ( Player_1(3)='1' AND Player_1(5)='1' )) ) THEN
				SPAV_OUT(4)<='1';
			ELSIF (( SPAV_IN(5)='0' AND Player_1(5)='0' ) AND (( Player_1(2)='1' AND Player_1(8)='1' ) OR ( Player_1(3)='1' AND Player_1(4)='1' )) ) THEN
				SPAV_OUT(5)<='1';
			ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0' ) AND (( Player_1(0)='1' AND Player_1(3)='1' ) OR ( Player_1(2)='1' AND Player_1(4)='1' ) OR ( Player_1(7)='1' AND Player_1(8)='1' )) ) THEN
				SPAV_OUT(6)<='1';
			ELSIF (( SPAV_IN(7)='0' AND Player_1(7)='0' ) AND (( Player_1(1)='1' AND Player_1(4)='1' ) OR ( Player_1(6)='1' AND Player_1(8)='1' )) ) THEN
				SPAV_OUT(7)<='1';
			ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0' ) AND (( Player_1(0)='1' AND Player_1(4)='1' ) OR ( Player_1(2)='1' AND Player_1(5)='1' ) OR ( Player_1(6)='1' AND Player_1(7)='1' )) ) THEN
				SPAV_OUT(8)<='1';
			ELSE
				--==========--
				-- LATERAIS --
				--==========--
				IF (( SPAV_IN(0)='0' AND Player_1(0)='0') AND (SPAV_IN(1)='0' AND Player_1(1)='0' AND SPAV_IN(3)='0' AND Player_1(3)='0') AND (SPAV_IN(2)='1' AND SPAV_IN(6)='1')) THEN
					SPAV_OUT(0)<='1';
				ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0') AND (SPAV_IN(1)='0' AND Player_1(1)='0' AND SPAV_IN(5)='0' AND Player_1(5)='0') AND (SPAV_IN(0)='1' AND SPAV_IN(8)='1')) THEN
					SPAV_OUT(2)<='1';
				ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0') AND (SPAV_IN(3)='0' AND Player_1(3)='0' AND SPAV_IN(7)='0' AND Player_1(7)='0') AND (SPAV_IN(0)='1' AND SPAV_IN(8)='1')) THEN
					SPAV_OUT(6)<='1';
				ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0') AND (SPAV_IN(5)='0' AND Player_1(5)='0' AND SPAV_IN(7)='0' AND Player_1(7)='0') AND (SPAV_IN(2)='1' AND SPAV_IN(6)='1')) THEN
					SPAV_OUT(8)<='1';
				ELSE
					--========--
					-- CENTRO --
					--========--
					IF SPAV_IN(4)='0' AND Player_1(4)='0' THEN
						SPAV_OUT(4)<='1';
					ELSE
						--=============--
						--DEFESA QUINAS--
						--=============--
						IF ( SPAV_IN(0)='0' AND Player_1(0)='0' AND Player_1(8)='0') THEN
							SPAV_OUT(0)<='1';
						ELSIF ( SPAV_IN(2)='0' AND Player_1(2)='0' AND Player_1(6)='0') THEN
							SPAV_OUT(2)<='1';
						ELSIF ( SPAV_IN(6)='0' AND Player_1(6)='0' AND Player_1(2)='0') THEN
							SPAV_OUT(6)<='1';
						ELSIF ( SPAV_IN(8)='0' AND Player_1(8)='0' AND Player_1(0)='0') THEN
							SPAV_OUT(8)<='1';
						ELSE
							--=============--
							--ATAQUE QUINAS--
							--=============--
							IF ( SPAV_IN(0)='0' AND Player_1(0)='0') THEN
								SPAV_OUT(0)<='1';
							ELSIF ( SPAV_IN(2)='0' AND Player_1(2)='0') THEN
								SPAV_OUT(2)<='1';
							ELSIF ( SPAV_IN(6)='0' AND Player_1(6)='0') THEN
								SPAV_OUT(6)<='1';
							ELSIF ( SPAV_IN(8)='0' AND Player_1(8)='0') THEN
								SPAV_OUT(8)<='1';
							ELSE
								--=============--
								--  DEU VELHA  --
								--=============--
								IF ( SPAV_IN(1)='0' AND Player_1(1)='0') THEN
									SPAV_OUT(1)<='1';
								ELSIF ( SPAV_IN(3)='0' AND Player_1(3)='0') THEN
									SPAV_OUT(3)<='1';
								ELSIF ( SPAV_IN(5)='0' AND Player_1(5)='0') THEN
									SPAV_OUT(5)<='1';
								ELSIF ( SPAV_IN(7)='0' AND Player_1(7)='0') THEN
									SPAV_OUT(7)<='1';
								END IF;
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		SPAV_OUT_o <= SPAV_OUT;
	END IF;
	END PROCESS;
END ARCHITECTURE;