LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE NLINHA_PACKAGE IS
PROCEDURE NLINHA(SIGNAL Linha:IN INTEGER RANGE 0 to 350;SIGNAL PLAYER_1_IN:IN STD_LOGIC_VECTOR(8 DOWNTO 0);SIGNAL HzPos,VtPos:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END NLINHA_PACKAGE;

PACKAGE BODY NLINHA_PACKAGE IS
PROCEDURE NLINHA(SIGNAL Linha:IN INTEGER RANGE 0 to 350;SIGNAL PLAYER_1_IN:IN STD_LOGIC_VECTOR(8 DOWNTO 0);SIGNAL HzPos,VtPos:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS

BEGIN
				IF(Linha > 1 AND Player_1_IN(0) = '1' AND Player_1_IN(1) = '1' AND Player_1_IN(2) = '1') AND ((VtPos >= 144 AND VtPos <= 146 + Linha) AND (HzPos >= 139 AND HzPos <= 141)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(3) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(5) = '1') AND ((HzPos >= 144 AND HzPos <= 146 + Linha) AND (VtPos >= 239 AND VtPos <= 241)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(6) = '1' AND Player_1_IN(7) = '1' AND Player_1_IN(8) = '1') AND ((HzPos >= 144 AND HzPos <= 146 + Linha) AND (VtPos >= 339 AND VtPos <= 341)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(0) = '1' AND Player_1_IN(3) = '1' AND Player_1_IN(6) = '1') AND ((VtPos >= 65 AND VtPos <= 65 + Linha) AND (HzPos >= 219 AND HzPos <= 221)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(1) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(7) = '1') AND ((VtPos >= 65 AND VtPos <= 65 + Linha) AND (HzPos >= 319 AND HzPos <= 321)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(2) = '1' AND Player_1_IN(5) = '1' AND Player_1_IN(8) = '1') AND ((VtPos >= 65 AND VtPos <= 65 + Linha) AND (HzPos >= 419 AND HzPos <= 421)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(0) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(8) = '1') AND (HzPos>145) AND HzPos<(145+Linha) AND (VtPos>65) AND VtPos<(65+Linha) AND (VtPos-(4) <= 65-(Linha*145)+(Linha*HzPos)) AND (65-(Linha*145)+(Linha*HzPos)<=VtPos+(4)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Linha > 1 AND Player_1_IN(2) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(6) = '1') THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;
 
END NLINHA;
END NLINHA_PACKAGE;				