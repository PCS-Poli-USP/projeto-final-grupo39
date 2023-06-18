LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE LINHA_PACKAGE IS
PROCEDURE LINHA(SIGNAL Linha:IN INTEGER RANGE 0 to 350;SIGNAL PLAYER_1_IN:IN STD_LOGIC_VECTOR(8 DOWNTO 0);SIGNAL HzPos,VtPos:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END LINHA_PACKAGE;

PACKAGE BODY LINHA_PACKAGE IS
PROCEDURE LINHA(SIGNAL Linha:IN INTEGER RANGE 0 to 350;SIGNAL PLAYER_1_IN:IN STD_LOGIC_VECTOR(8 DOWNTO 0);SIGNAL HzPos,VtPos:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS

BEGIN
				IF(Player_1_IN(0) = '1' AND Player_1_IN(1) = '1' AND Player_1_IN(2) = '1') AND ((HzPos >= 150 AND HzPos <= 490) AND (VtPos >= 139 AND VtPos <= 141)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(3) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(5) = '1') AND ((HzPos >= 150 AND HzPos <= 490 ) AND (VtPos >= 239 AND VtPos <= 241)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(6) = '1' AND Player_1_IN(7) = '1' AND Player_1_IN(8) = '1') AND ((HzPos >= 150 AND HzPos <= 490 ) AND (VtPos >= 339 AND VtPos <= 341)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(0) = '1' AND Player_1_IN(3) = '1' AND Player_1_IN(6) = '1') AND ((VtPos >= 70 AND VtPos <= 410 ) AND (HzPos >= 219 AND HzPos <= 221)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(1) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(7) = '1') AND ((VtPos >= 70 AND VtPos <= 410 ) AND (HzPos >= 319 AND HzPos <= 321)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(2) = '1' AND Player_1_IN(5) = '1' AND Player_1_IN(8) = '1') AND ((VtPos >= 70 AND VtPos <= 410 ) AND (HzPos >= 419 AND HzPos <= 421)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(0) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(8) = '1') AND (HzPos>155) AND HzPos<(485) AND (VtPos>75) AND VtPos<(405) AND (79 <= (HzPos - VtPos)) AND (81 >= (HzPos - VtPos)) THEN
						R <= "1111";
						G  <= "1111";
						B  <= "1111";
						DRAW<='1';
				ELSIF(Player_1_IN(2) = '1' AND Player_1_IN(4) = '1' AND Player_1_IN(6) = '1') AND (HzPos>155) AND HzPos<(485) AND (VtPos>75) AND VtPos<(405) AND (559 <= (HzPos + VtPos)) AND (561 >= (HzPos + VtPos)) THEN
						 R<="1111";
						 G<="1111";
						 B<="1111";
						 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;
 
END LINHA;
END LINHA_PACKAGE;				