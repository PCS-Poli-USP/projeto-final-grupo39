LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE WORK.X_PACKAGE.ALL;

ENTITY CONTROLADOR_VGA IS
	PORT(
	   CLK		: IN std_logic;  -- Clock FPGA.
		RST		: IN std_logic;  -- RESET.
		HSYNC 	: OUT std_logic; --Sync Horizontal 
		VSYNC 	: OUT std_logic; --Sync Vertical
		R			: OUT std_logic_vector(3 downto 0); --bits de R (1111 = max)
		G			: OUT std_logic_vector(3 downto 0); --bits de G (1111 = max)
		B	   	 : OUT std_logic_vector(3 downto 0) --bits de B (1111 = max)
	);
END ENTITY CONTROLADOR_VGA;



ARCHITECTURE CONTROLADOR_VGA_ARCH OF CONTROLADOR_VGA IS

SIGNAL clk25M : std_logic := '0'; -- Clock para a resolução 640 x 480 (caso necessária)

--====================================================--
				  --CONFIGURAÇÕES DE RESOLUÇÃO--
--====================================================--
					 --Pressets 640x480 60Hz--
--CLK 25MHz
						 
--Resolução Horizontal := 639
--Front Porch Horizontal := 16
--Back Porch Horizontal := 48
--Sync Pulse Horizontal := 96

--Resolução Vertical := 479
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

CONSTANT HD :  integer := 639; --Resolução Horizontal

CONSTANT HFP : integer := 16;  --Front Porch Horizontal

CONSTANT HBP : integer := 48;  --Back Porch Horizontal

CONSTANT HSP : integer := 96;  --Sync Pulse Horizontal

--====================================================--
							 -- VERTICAL --
							 
CONSTANT VD :  integer := 479; --Resolução Vertical

CONSTANT VFP : integer := 10;  --Front Porch Vertical

CONSTANT VBP : integer := 33;  --Back Porch Vertical

CONSTANT VSP : integer := 2; 	 --Sync Pulse Vertical

--====================================================--
--====================================================--

SIGNAL HzPos : integer := 0; --Posição Horizontal
SIGNAL VtPos : integer := 0; --Posição Vertical

SIGNAL videoEN : std_logic :='0';

BEGIN	
	
		
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

Desenho:PROCESS(clk25M, HzPos, VtPos, videoEN)
BEGIN
	IF(RST = '1')THEN
		R <= "0000";
		G  <= "0000";
		B  <= "0000";
	ELSIF rising_edge(clk25M) THEN
		IF(videoEN = '1')THEN
			IF(((HzPos >= 315 AND HzPos <= 325) OR (VtPos >= 235 AND VtPos <= 245)) OR (((HzPos >= 0 AND HzPos <= 10) OR (HzPos >= 630 AND HzPos <= 640) OR (VtPos >= 0 AND VtPos <= 10) OR (VtPos >= 470 AND VtPos <= 480))))THEN
				R <= "1111";
				G  <= "1111";
				B  <= "1111";
			ELSE
				R <= "0000";
				G  <= "0000";
				B  <= "0000";
			END IF;
		ELSE
			R <= "0000";
			G  <= "0000";
			B  <= "0000";
		END IF;
	END IF;
END PROCESS;
END ARCHITECTURE CONTROLADOR_VGA_ARCH; 