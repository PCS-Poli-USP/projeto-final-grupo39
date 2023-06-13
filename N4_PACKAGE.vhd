LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE N4_PACKAGE IS
PROCEDURE N4(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END N4_PACKAGE;

PACKAGE BODY N4_PACKAGE IS
PROCEDURE N4(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS
CONSTANT size : INTEGER := 4;

BEGIN

 IF ((EN_DRAW = '1') AND  (((xcur >= xpos + 3*size and xcur < xpos + 4*size) and (ycur >= ypos and ycur < ypos + 7*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and ((xcur >= xpos + 0*size and xcur < xpos + 3*size))) or
                    ((xcur >= xpos + 0*size and xcur < xpos + 1*size) and (ycur >= ypos and ycur < ypos + 4*size)))) THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;
 
END N4;
END N4_PACKAGE;