LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SPAV IS 
	PORT (
		CLK_IN 		: IN std_logic; -- clock de entrada
		Enable		: IN std_logic; -- Enable do SPAV
		Player_1 	: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas do Player 1
		SPAV_IN 		: IN std_logic_vector(8 DOWNTO 0); -- entrada da posição das jogadas anteriores do SPAV
		SPAV_OUT 	: OUT std_logic_vector(8 DOWNTO 0) --  saída da posição das jogadas do SPAV
        );
END SPAV; -- fim da entidade

ARCHITECTURE rtl OF SPAV IS -- arquitetura da UART_RX é: 

	TYPE ESTADO IS (IDLE, KILL, BLOQUEIO, LATERAIS, CENTRO, QUINA_DEFESA, QUINA_ATAQUE); 
	
	SIGNAL SM_Main : ESTADO := IDLE; -- estado inativo/inicial da máquina de estados
	SIGNAL EN : std_logic;
	
	BEGIN
	
	EN <= Enable AND CLK_IN;
	
	SPAV_BRAIN : PROCESS (CLK_IN, EN)
	BEGIN
	
		IF rising_edge(EN) THEN
			
			CASE SM_Main IS -- definição do estado inicial da máquina de estados
			
				WHEN IDLE =>
					IF Player_1 = "000000000" THEN
						SPAV_OUT <= "000000000";
						SM_Main <= IDLE;
					ELSE
						SM_Main <= KILL; 
					END IF;
					
					
				WHEN KILL => 
					IF (( SPAV_IN(0)='0' AND Player_1(0)='0' ) AND (( SPAV_IN(1)='1' AND SPAV_IN(2)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(8)='1' ))) THEN
						SPAV_OUT(0)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(1)='0' AND Player_1(1)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(2)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(7)='1' )) ) THEN
						SPAV_OUT(1)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(1)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(5)='1' AND SPAV_IN(8)='1' )) ) THEN
						SPAV_OUT(2)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(3)='0' AND Player_1(3)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(5)='1' )) ) THEN
						SPAV_OUT(3)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(4)='0' AND Player_1(4)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(1)='1' AND SPAV_IN(7)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(5)='1' )) ) THEN
						SPAV_OUT(4)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(5)='0' AND Player_1(5)='0' ) AND (( SPAV_IN(2)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(4)='1' )) ) THEN
						SPAV_OUT(5)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(3)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(7)='1' AND SPAV_IN(8)='1' )) ) THEN
						SPAV_OUT(6)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(7)='0' AND Player_1(7)='0' ) AND (( SPAV_IN(1)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(6)='1' AND SPAV_IN(8)='1' )) ) THEN
						SPAV_OUT(7)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(5)='1' ) OR ( SPAV_IN(6)='1' AND SPAV_IN(7)='1' )) ) THEN
						SPAV_OUT(8)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= BLOQUEIO;
					END IF;	
						
				WHEN BLOQUEIO => 
					IF (( SPAV_IN(0)='0' AND Player_1(0)='0' ) AND (( Player_1(1)='1' AND Player_1(2)='1' ) OR ( Player_1(3)='1' AND Player_1(6)='1' ) OR ( Player_1(4)='1' AND Player_1(8)='1' )) ) THEN
						SPAV_OUT(0)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(1)='0' AND Player_1(1)='0' ) AND (( Player_1(0)='1' AND Player_1(2)='1' ) OR ( Player_1(4)='1' AND Player_1(7)='1' )) ) THEN
						SPAV_OUT(1)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0' ) AND (( Player_1(0)='1' AND Player_1(1)='1' ) OR ( Player_1(4)='1' AND Player_1(6)='1' ) OR ( Player_1(5)='1' AND Player_1(8)='1' )) ) THEN
						SPAV_OUT(2)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(3)='0' AND Player_1(3)='0' ) AND (( Player_1(0)='1' AND Player_1(6)='1' ) OR ( Player_1(4)='1' AND Player_1(5)='1' )) ) THEN
						SPAV_OUT(3)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(4)='0' AND Player_1(4)='0' ) AND (( Player_1(0)='1' AND Player_1(8)='1' ) OR ( Player_1(2)='1' AND Player_1(6)='1' ) OR ( Player_1(1)='1' AND Player_1(7)='1' ) OR ( Player_1(3)='1' AND Player_1(5)='1' )) ) THEN
						SPAV_OUT(4)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(5)='0' AND Player_1(5)='0' ) AND (( Player_1(2)='1' AND Player_1(8)='1' ) OR ( Player_1(3)='1' AND Player_1(4)='1' )) ) THEN
						SPAV_OUT(5)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0' ) AND (( Player_1(0)='1' AND Player_1(3)='1' ) OR ( Player_1(2)='1' AND Player_1(4)='1' ) OR ( Player_1(7)='1' AND Player_1(8)='1' )) ) THEN
						SPAV_OUT(6)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(7)='0' AND Player_1(7)='0' ) AND (( Player_1(1)='1' AND Player_1(4)='1' ) OR ( Player_1(6)='1' AND Player_1(8)='1' )) ) THEN
						SPAV_OUT(7)<='1';
						SM_Main <= IDLE;
					ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0' ) AND (( Player_1(0)='1' AND Player_1(4)='1' ) OR ( Player_1(2)='1' AND Player_1(5)='1' ) OR ( Player_1(6)='1' AND Player_1(7)='1' )) ) THEN
						SPAV_OUT(8)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= LATERAIS;
					END IF;
				
				WHEN LATERAIS => 
					IF (( SPAV_IN(0)='0' AND Player_1(0)='0') AND (SPAV_IN(1)='0' AND Player_1(1)='0' AND SPAV_IN(3)='0' AND Player_1(3)='0') AND (SPAV_IN(2)='1' AND SPAV_IN(6)='1')) THEN
						SPAV_OUT(0)<='1';
						SM_Main <= IDLE;
					--ELSIF (( SPAV_IN(1)='0' AND Player_1(1)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(2)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(7)='1' )) ) THEN
						--SPAV_OUT(1)<='1';
						--SM_Main <= IDLE;
					ELSIF (( SPAV_IN(2)='0' AND Player_1(2)='0') AND (SPAV_IN(1)='0' AND Player_1(1)='0' AND SPAV_IN(5)='0' AND Player_1(5)='0') AND (SPAV_IN(0)='1' AND SPAV_IN(8)='1')) THEN
						SPAV_OUT(2)<='1';
						SM_Main <= IDLE;
					--ELSIF (( SPAV_IN(3)='0' AND Player_1(3)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(4)='1' AND SPAV_IN(5)='1' )) ) THEN
						--SPAV_OUT(3)<='1';
						--SM_Main <= IDLE;
					--ELSIF (( SPAV_IN(4)='0' AND Player_1(4)='0' ) AND (( SPAV_IN(0)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(2)='1' AND SPAV_IN(6)='1' ) OR ( SPAV_IN(1)='1' AND SPAV_IN(7)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(5)='1' )) ) THEN
						--SPAV_OUT(4)<='1';
						--SM_Main <= IDLE;
					--ELSIF (( SPAV_IN(5)='0' AND Player_1(5)='0' ) AND (( SPAV_IN(2)='1' AND SPAV_IN(8)='1' ) OR ( SPAV_IN(3)='1' AND SPAV_IN(4)='1' )) ) THEN
						--SPAV_OUT(5)<='1';
						--SM_Main <= IDLE;
					ELSIF (( SPAV_IN(6)='0' AND Player_1(6)='0') AND (SPAV_IN(3)='0' AND Player_1(3)='0' AND SPAV_IN(7)='0' AND Player_1(7)='0') AND (SPAV_IN(0)='1' AND SPAV_IN(8)='1')) THEN
						SPAV_OUT(6)<='1';
						SM_Main <= IDLE;
					--ELSIF (( SPAV_IN(7)='0' AND Player_1(7)='0' ) AND (( SPAV_IN(1)='1' AND SPAV_IN(4)='1' ) OR ( SPAV_IN(6)='1' AND SPAV_IN(8)='1' )) ) THEN
						--SPAV_OUT(7)<='1';
						--SM_Main <= IDLE;
					ELSIF (( SPAV_IN(8)='0' AND Player_1(8)='0') AND (SPAV_IN(5)='0' AND Player_1(5)='0' AND SPAV_IN(7)='0' AND Player_1(7)='0') AND (SPAV_IN(2)='1' AND SPAV_IN(6)='1')) THEN
						SPAV_OUT(8)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= CENTRO;
					END IF;

				WHEN CENTRO => 
					IF SPAV_IN(4)='0' AND Player_1(4)='0' THEN
						SPAV_OUT(4)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= QUINA_DEFESA;
					END IF;
					
				WHEN QUINA_DEFESA => 
					IF ( SPAV_IN(0)='0' AND Player_1(0)='0' AND Player_1(8)='1') THEN
						SPAV_OUT(0)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(2)='0' AND Player_1(2)='0' AND Player_1(6)='1') THEN
						SPAV_OUT(2)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(6)='0' AND Player_1(6)='0' AND Player_1(2)='1') THEN
						SPAV_OUT(6)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(8)='0' AND Player_1(8)='0' AND Player_1(0)='1') THEN
						SPAV_OUT(8)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= QUINA_ATAQUE;
					END IF;
					
				WHEN QUINA_ATAQUE => 
					IF ( SPAV_IN(0)='0' AND Player_1(0)='0') THEN
						SPAV_OUT(0)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(2)='0' AND Player_1(2)='0') THEN
						SPAV_OUT(2)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(6)='0' AND Player_1(6)='0') THEN
						SPAV_OUT(6)<='1';
						SM_Main <= IDLE;
					ELSIF ( SPAV_IN(8)='0' AND Player_1(8)='0') THEN
						SPAV_OUT(8)<='1';
						SM_Main <= IDLE;
					ELSE
						SM_Main <= IDLE;
					END IF;

            END CASE;
		END IF;
	END PROCESS SPAV_BRAIN;
END architecture;
