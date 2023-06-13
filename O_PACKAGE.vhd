LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE O_PACKAGE IS
PROCEDURE DO(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END O_PACKAGE;

PACKAGE BODY O_PACKAGE IS
PROCEDURE DO(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS
CONSTANT L_aux : INTEGER := 4;
CONSTANT R_aux : INTEGER := 30;
CONSTANT X_aux : INTEGER := 50;
CONSTANT Y_aux : INTEGER := 50;
BEGIN

--IF EN_DRAW_X = '1' AND ((Xcur+Xpos >= Ycur-(4)+Ypos AND Xcur+Xpos <= Ycur+(4)+Ypos) OR (Xcur-Xpos >= Ypos+X_aux-(L_aux)-Ycur AND Xcur+Xpos <= Ypos+X_aux-Ycur)) THEN
--IF EN_DRAW_X = '1' AND (Xcur>Xpos) AND Xcur<(Xpos+X_aux) AND (Ycur>Ypos) AND Ycur<(Ypos+Y_aux) AND (((Ycur-(4) <= Ypos-((Y_aux/X_aux)*Xpos)+((Y_aux/X_aux)*Xcur) AND Ypos-((Y_aux/X_aux)*Xpos)+((Y_aux/X_aux)*Xcur)<=Ycur+(4))) OR (Ycur-(4) <= -((Y_aux/X_aux)*Xcur)+Ypos+Y_aux+(Xpos*(Y_aux/X_aux)) AND -((Y_aux/X_aux)*Xcur)+Ypos+Y_aux+(Xpos*(Y_aux/X_aux))<=Ycur+(4))) THEN
 
 --IF((Xcur>Xpos AND Xcur<(Xpos+X_aux) AND Ycur>Ypos AND Ycur<(Ypos+Y_aux)) AND ((Xcur>=Ycur AND Xcur<=(Ycur+L_aux))
--																	OR (Xcur>=((Y_aux-L_aux+1)-Ycur) AND Xcur<=((Y_aux+1)-Ycur))))THEN
IF EN_DRAW = '1' AND ((R_aux-(L_aux/2))**2 < (Xcur-Xpos-(X_aux/2))**2 + (YCur-Ypos-(Y_aux/2))**2) AND ((R_aux+(L_aux/2))**2 > (XCur-Xpos-(X_aux/2))**2 + (YCur-Ypos-(Y_aux/2))**2) THEN
--IF (EN_DRAW_X = '1' AND (Xcur>Xpos) AND Xcur<(Xpos+X_aux) AND (Ycur>Ypos) AND Ycur<(Ypos+Y_aux)) THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;
 
END DO;
END O_PACKAGE;