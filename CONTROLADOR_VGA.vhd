LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE WORK.X_PACKAGE.ALL;USE WORK.O_PACKAGE.ALL;
USE WORK.N0_PACKAGE.ALL;USE WORK.N1_PACKAGE.ALL;USE WORK.N2_PACKAGE.ALL;USE WORK.N3_PACKAGE.ALL;USE WORK.N4_PACKAGE.ALL;USE WORK.N5_PACKAGE.ALL;USE WORK.N6_PACKAGE.ALL;USE WORK.N7_PACKAGE.ALL;USE WORK.N8_PACKAGE.ALL;USE WORK.N9_PACKAGE.ALL;
USE WORK.LINHA_PACKAGE.ALL;
USE WORK.LW_PACKAGE.ALL;USE WORK.LI_PACKAGE.ALL;USE WORK.LN_PACKAGE.ALL;USE WORK.LS_PACKAGE.ALL;
USE WORK.LTROFEU_PACKAGE.ALL;

ENTITY CONTROLADOR_VGA IS
	PORT(
	   CLK		: IN std_logic;  -- Clock FPGA.
		RST		: IN std_logic;  -- RESET.
		HSYNC 	: OUT std_logic; --Sync Horizontal 
		VSYNC 	: OUT std_logic; --Sync Vertical
		R			: OUT std_logic_vector(3 downto 0); --bits de R (1111 = max)
		G			: OUT std_logic_vector(3 downto 0); --bits de G (1111 = max)
		B	   	: OUT std_logic_vector(3 downto 0); --bits de B (1111 = max)
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
END ENTITY CONTROLADOR_VGA;



ARCHITECTURE CONTROLADOR_VGA_ARCH OF CONTROLADOR_VGA IS

SIGNAL clk25M : std_logic := '0'; -- Clock para a resolução 640 x 480 (caso necessária)

--====================================================--
				  --CONFIGURAÇÕES DE RESOLUÇÃO--
--====================================================--
					 --Pressets 640x480 60Hz--
--CLK 25MHz
						 
--Resolução Horizontal := 640
--Front Porch Horizontal := 16
--Back Porch Horizontal := 48
--Sync Pulse Horizontal := 96

--Resolução Vertical := 480
--Front Porch Vertical := 10
--Back Porch Vertical := 33
--Sync Pulse Vertical := 2

					  --Pressets 800x600 72Hz--
--CLK 50MHZ
						 
--Resolução Horizontal := 800
--Front Porch Horizontal := 56
--Back Porch Horizontal := 64
--Sync Pulse Horizontal := 120

--Resolução Vertical := 600
--Front Porch Vertical := 37
--Back Porch Vertical := 23
--Sync Pulse Vertical := 6

--====================================================--
--====================================================--
						   -- HORIZONTAL --

CONSTANT HD :  integer := 640; --Resolução Horizontal

CONSTANT HFP : integer := 16;  --Front Porch Horizontal

CONSTANT HBP : integer := 48;  --Back Porch Horizontal

CONSTANT HSP : integer := 96;  --Sync Pulse Horizontal

--====================================================--
							 -- VERTICAL --
							 
CONSTANT VD :  integer := 480; --Resolução Vertical

CONSTANT VFP : integer := 10;  --Front Porch Vertical

CONSTANT VBP : integer := 33;  --Back Porch Vertical

CONSTANT VSP : integer := 2; 	 --Sync Pulse Vertical

--====================================================--
--====================================================--

SIGNAL HzPos : integer := 0; --Posição Horizontal
SIGNAL VtPos : integer := 0; --Posição Vertical

SIGNAL videoEN : std_logic :='0';

SIGNAL DRAW0_XP,DRAW1_XP,DRAW2_XP,DRAW3_XP,DRAW4_XP,DRAW5_XP,DRAW6_XP,DRAW7_XP,DRAW8_XP:STD_LOGIC:='0';
SIGNAL DRAW0_OP,DRAW1_OP,DRAW2_OP,DRAW3_OP,DRAW4_OP,DRAW5_OP,DRAW6_OP,DRAW7_OP,DRAW8_OP:STD_LOGIC:='0';
SIGNAL DRAW0_X,DRAW1_X,DRAW2_X,DRAW3_X,DRAW4_X,DRAW5_X,DRAW6_X,DRAW7_X,DRAW8_X:STD_LOGIC:='0';
SIGNAL DRAW0_O,DRAW1_O,DRAW2_O,DRAW3_O,DRAW4_O,DRAW5_O,DRAW6_O,DRAW7_O,DRAW8_O:STD_LOGIC:='0';
SIGNAL DRAW0_P1,DRAW1_P1,DRAW2_P1,DRAW3_P1,DRAW4_P1,DRAW5_P1,DRAW6_P1,DRAW7_P1,DRAW8_P1,DRAW9_P1:STD_LOGIC:='0';
SIGNAL DRAW0_P2,DRAW1_P2,DRAW2_P2,DRAW3_P2,DRAW4_P2,DRAW5_P2,DRAW6_P2,DRAW7_P2,DRAW8_P2,DRAW9_P2:STD_LOGIC:='0';
SIGNAL DRAW0_WX,DRAW1_WX,DRAW2_WX,DRAW3_WX,DRAW4_WX,DRAW5_WX,DRAW6_WX,DRAW7_WX,DRAW8_WX,DRAW9_WX:STD_LOGIC:='0';
SIGNAL DRAW0_WO,DRAW1_WO,DRAW2_WO,DRAW3_WO,DRAW4_WO,DRAW5_WO,DRAW6_WO,DRAW7_WO,DRAW8_WO,DRAW9_WO:STD_LOGIC:='0';
SIGNAL DRAW0_L, DRAW1_L:STD_LOGIC:='0';
SIGNAL HPOS1	: INTEGER :=195;
SIGNAL VPOS1	: INTEGER :=115;
SIGNAL HPOS2	: INTEGER :=295;
SIGNAL VPOS2	: INTEGER :=215;
SIGNAL HPOS3	: INTEGER :=395;
SIGNAL VPOS3	: INTEGER :=315;
SIGNAL HPLACAR1: INTEGER :=64;
SIGNAL VPLACAR1: INTEGER :=50;
SIGNAL HPLACAR2: INTEGER :=560;
SIGNAL VPLACAR2: INTEGER :=50;
SIGNAL HLETRAS1: INTEGER :=150;
SIGNAL HLETRAS2: INTEGER :=200;
SIGNAL HLETRAS3: INTEGER :=250;
SIGNAL HLETRAS4: INTEGER :=300;
SIGNAL HLETRAS5: INTEGER :=350;
SIGNAL HLETRAS6: INTEGER :=400;
SIGNAL VLETRAS	: INTEGER :=200;
SIGNAL EN_DRAW_X_temp : STD_LOGIC := '1';
SIGNAL R_aux, G_aux, B_aux : std_logic_vector(3 DOWNTO 0);
SIGNAL LINHA_aux : INTEGER RANGE 0 TO 350:=0;

BEGIN	
Linha_aux <= LINHA_IN;

DX(Player_1_Pre(0),HPOS1,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_XP);
DX(Player_1_Pre(1),HPOS2,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_XP);
DX(Player_1_Pre(2),HPOS3,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_XP);
DX(Player_1_Pre(3),HPOS1,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_XP);
DX(Player_1_Pre(4),HPOS2,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_XP);
DX(Player_1_Pre(5),HPOS3,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_XP);
DX(Player_1_Pre(6),HPOS1,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_XP);
DX(Player_1_Pre(7),HPOS2,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_XP);
DX(Player_1_Pre(8),HPOS3,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_XP);

DO(Player_2_Pre(0),HPOS1,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_OP);
DO(Player_2_Pre(1),HPOS2,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_OP);
DO(Player_2_Pre(2),HPOS3,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_OP);
DO(Player_2_Pre(3),HPOS1,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_OP);
DO(Player_2_Pre(4),HPOS2,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_OP);
DO(Player_2_Pre(5),HPOS3,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_OP);
DO(Player_2_Pre(6),HPOS1,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_OP);
DO(Player_2_Pre(7),HPOS2,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_OP);
DO(Player_2_Pre(8),HPOS3,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_OP);

DX(Player_1_IN(0),HPOS1,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_X);
DX(Player_1_IN(1),HPOS2,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_X);
DX(Player_1_IN(2),HPOS3,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_X);
DX(Player_1_IN(3),HPOS1,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_X);
DX(Player_1_IN(4),HPOS2,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_X);
DX(Player_1_IN(5),HPOS3,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_X);
DX(Player_1_IN(6),HPOS1,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_X);
DX(Player_1_IN(7),HPOS2,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_X);
DX(Player_1_IN(8),HPOS3,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_X);

DO(Player_2_IN(0),HPOS1,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_O);
DO(Player_2_IN(1),HPOS2,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_O);
DO(Player_2_IN(2),HPOS3,VPOS1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_O);
DO(Player_2_IN(3),HPOS1,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_O);
DO(Player_2_IN(4),HPOS2,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_O);
DO(Player_2_IN(5),HPOS3,VPOS2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_O);
DO(Player_2_IN(6),HPOS1,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_O);
DO(Player_2_IN(7),HPOS2,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_O);
DO(Player_2_IN(8),HPOS3,VPOS3,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_O);

N0(Placar1_IN(0),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_P1);
N1(Placar1_IN(1),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_P1);
N2(Placar1_IN(2),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_P1);
N3(Placar1_IN(3),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_P1);
N4(Placar1_IN(4),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_P1);
N5(Placar1_IN(5),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_P1);
N6(Placar1_IN(6),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_P1);
N7(Placar1_IN(7),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_P1);
N8(Placar1_IN(8),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_P1);
N9(Placar1_IN(9),HPLACAR1,VPLACAR1,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW9_P1);

N0(Placar2_IN(0),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_P2);
N1(Placar2_IN(1),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_P2);
N2(Placar2_IN(2),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_P2);
N3(Placar2_IN(3),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_P2);
N4(Placar2_IN(4),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_P2);
N5(Placar2_IN(5),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_P2);
N6(Placar2_IN(6),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW6_P2);
N7(Placar2_IN(7),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW7_P2);
N8(Placar2_IN(8),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW8_P2);
N9(Placar2_IN(9),HPLACAR2,VPLACAR2,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW9_P2);

LINHA(Linha_aux,Player_1_IN,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_L);
LINHA(Linha_aux,Player_2_IN,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_L);

DX(TELA_WINX_IN,HLETRAS1,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_WX);
LW(TELA_WINX_IN,HLETRAS2,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_WX);
LI(TELA_WINX_IN,HLETRAS3,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_WX);
LN(TELA_WINX_IN,HLETRAS4,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_WX);
LS(TELA_WINX_IN,HLETRAS5,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_WX);
LTROFEU(TELA_WINX_IN,HLETRAS6,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_WX);

DO(TELA_WINO_IN,HLETRAS1,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW0_WO);
LW(TELA_WINO_IN,HLETRAS2,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW1_WO);
LI(TELA_WINO_IN,HLETRAS3,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW2_WO);
LN(TELA_WINO_IN,HLETRAS4,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW3_WO);
LS(TELA_WINO_IN,HLETRAS5,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW4_WO);
LTROFEU(TELA_WINO_IN,HLETRAS6,VLETRAS,HzPos,VtPos,R_aux,G_aux,B_aux,DRAW5_WO);
		
Clock_Div : PROCESS(CLK) -- Clock para a resolução 640 x 480 (caso necessária)
BEGIN
	IF rising_edge(CLK) THEN
		clk25M <= NOT clk25M;
	END IF;
END PROCESS;

Pos_Horizontal:PROCESS(clk25M, RST)
BEGIN 
	IF(RST = '1') THEN
		HzPos <= 0;
	ELSIF rising_edge(clk25M) THEN
		IF(HzPos = (HD + HFP + HBP + HSP)) THEN
			HzPos <= 0;
		ELSE
			HzPos <= HzPos + 1;
		END IF;
	END IF;
END PROCESS;

Pos_Vertical:PROCESS(clk25M, RST)
BEGIN 
	IF(RST = '1') THEN
		VtPos <= 0;
	ELSIF rising_edge(clk25M) THEN
		IF(HzPos = (HD + HFP + HBP + HSP)) THEN
			IF(VtPos = (VD + VFP + VBP + VSP)) THEN
				VtPos <= 0;
			ELSE
				VtPos <= VtPos + 1;
			END IF;
		END IF;
	END IF;
END PROCESS;

Sync_Horizontal:PROCESS(clk25M, RST, HzPos)
BEGIN
	IF(RST = '1')THEN
		HSYNC <= '0';
	ELSIF rising_edge(clk25M) THEN
		IF((HzPos <= (HD + HFP)) OR (HzPos > HD + HFP + HSP))THEN
			HSYNC <= '1';
		ELSE 
			HSYNC <= '0';
		END IF;
	END IF;
END PROCESS;

Sync_Vertical:PROCESS(clk25M, RST, VtPos)
BEGIN
	IF(RST = '1')THEN
		VSYNC <= '0';
	ELSIF rising_edge(clk25M) THEN
		IF((VtPos <= (VD + VFP)) OR (VtPos > VD + VFP + VSP))THEN
			VSYNC <= '1';
		ELSE 
			VSYNC <= '0';
		END IF;
	END IF;
END PROCESS;

Controlador_Video:PROCESS(clk25M, RST, HzPos, VtPos)
BEGIN 
	IF(RST = '1')THEN
		videoEN <= '0';
	ELSIF rising_edge(clk25M) THEN
		IF(HzPos <= HD AND VtPos <= VD)THEN
			videoEN <= '1';
		ELSE
			videoEN <= '0';
		END IF;
	END IF;
END PROCESS;

Desenho:PROCESS(clk25M, HzPos, VtPos, videoEN, RST, Linha_aux)
BEGIN
	IF(RST = '1')THEN
		R <= "0000";
		G  <= "0000";
		B  <= "0000";
	ELSIF rising_edge(clk25M) THEN
		IF(videoEN = '1')THEN
			IF(TELA_WINX_IN = '1' OR TELA_WINO_IN = '1') THEN
				--IF(DRAW0_WX = '1') THEN
				--	R 	<= "1111";
				--	G  <= "0000";
				--	B  <= "0000";
				--ELSIF(DRAW0_WO = '1') THEN
				--	R 	<= "0000";
				--	G  <= "0100";
				--	B  <= "1111";
				IF(DRAW1_WX = '1' OR DRAW2_WX = '1' OR DRAW3_WX = '1' OR DRAW4_WX = '1') THEN
					R 	<= "1111";
					G  <= "0000";
					B  <= "0000";
				ELSIF(DRAW1_WO = '1' OR DRAW2_WO = '1' OR DRAW3_WO = '1' OR DRAW4_WO = '1') THEN
					R 	<= "0000";
					G  <= "0100";
					B  <= "1111";
				ELSIF(DRAW5_WX = '1' OR DRAW5_WO = '1') THEN
					R 	<= "1111";
					G  <= "1101";
					B  <= "0000";
				ELSE
					R 	<= "0000";
					G  <= "0000";
					B  <= "0000";
				END IF;
			ELSE
				IF(DRAW0_L = '1' OR DRAW1_L = '1') THEN
					R <= "1111";
					G  <= "1111";
					B  <= "1111";
				ELSIF(DRAW0_XP = '1' OR DRAW1_XP = '1' OR DRAW2_XP = '1' OR DRAW3_XP = '1' OR DRAW4_XP = '1' OR DRAW5_XP = '1' OR DRAW6_XP = '1' OR DRAW7_XP = '1' OR DRAW8_XP = '1') THEN
					R <= "1111";
					G  <= "0111";
					B  <= "0111";
				ELSIF(DRAW0_OP = '1' OR DRAW1_OP = '1' OR DRAW2_OP = '1' OR DRAW3_OP = '1' OR DRAW4_OP = '1' OR DRAW5_OP = '1' OR DRAW6_OP = '1' OR DRAW7_OP = '1' OR DRAW8_OP = '1') THEN
					R <= "0111";
					G  <= "1000";
					B  <= "1111";
				ELSIF(DRAW0_X = '1' OR DRAW1_X = '1' OR DRAW2_X = '1' OR DRAW3_X = '1' OR DRAW4_X = '1' OR DRAW5_X = '1' OR DRAW6_X = '1' OR DRAW7_X = '1' OR DRAW8_X = '1') THEN
					R <= "1111";
					G  <= "0000";
					B  <= "0000";
				ELSIF(DRAW0_O = '1' OR DRAW1_O = '1' OR DRAW2_O = '1' OR DRAW3_O = '1' OR DRAW4_O = '1' OR DRAW5_O = '1' OR DRAW6_O = '1' OR DRAW7_O = '1' OR DRAW8_O = '1') THEN
					R <= "0000";
					G  <= "0100";
					B  <= "1111";
				ELSIF(DRAW0_P1 = '1' OR DRAW1_P1 = '1' OR DRAW2_P1 = '1' OR DRAW3_P1 = '1' OR DRAW4_P1 = '1' OR DRAW5_P1 = '1' OR DRAW6_P1 = '1' OR DRAW7_P1 = '1' OR DRAW8_P1 = '1' OR DRAW9_P1 = '1') THEN
					R <= "1111";
					G  <= "0000";
					B  <= "0000";
				ELSIF(DRAW0_P2 = '1' OR DRAW1_P2 = '1' OR DRAW2_P2 = '1' OR DRAW3_P2 = '1' OR DRAW4_P2 = '1' OR DRAW5_P2 = '1' OR DRAW6_P2 = '1' OR DRAW7_P2 = '1' OR DRAW8_P2 = '1' OR DRAW9_P2 = '1') THEN
					R <= "0000";
					G  <= "0100";
					B  <= "1111";
				--ELSIF(((HzPos >= 318 AND HzPos <= 322) OR (VtPos >= 238 AND VtPos <= 242)) OR (((HzPos >= 0 AND HzPos <= 4) OR (HzPos >= 636 AND HzPos <= 640) OR (VtPos >= 0 AND VtPos <= 4) OR (VtPos >= 476 AND VtPos <= 480)))) THEN
				--ELSIF (((HzPos >= 0 AND HzPos <= 4) OR (HzPos >= 636 AND HzPos <= 640) OR (VtPos >= 0 AND VtPos <= 4) OR (VtPos >= 476 AND VtPos <= 480))) THEN
				--	R <= "0000";
				--	G  <= "1111";
				--	B  <= "0000";
				ELSIF ((VtPos >= 90 AND VtPos <= 390) AND (HzPos >= 170 AND HzPos <= 470)) AND (((VtPos >= 189 AND VtPos <= 191) OR (VtPos >= 289 AND VtPos <= 291) OR (HzPos >= 269 AND HzPos <= 271)) OR (HzPos >= 369 AND HzPos <= 371)) THEN
					R <= "1111";
					G  <= "1111";
					B  <= "1111";
				ELSE
					R <= "0000";
					G  <= "0000";
					B  <= "0000";
				END IF;
			END IF;
		ELSE
			R <= "0000";
			G  <= "0000";
			B  <= "0000";
		END IF;
	END IF;
END PROCESS;
END ARCHITECTURE CONTROLADOR_VGA_ARCH; 