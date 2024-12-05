LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE N5_PACKAGE IS
PROCEDURE N5(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END N5_PACKAGE;

PACKAGE BODY N5_PACKAGE IS
PROCEDURE N5(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS
CONSTANT size : INTEGER := 5;

BEGIN

 IF ((EN_DRAW = '1') AND (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 0*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 4*size) and (xcur >= xpos + 0*size and xcur < xpos + 1*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)))) THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;
 
END N5;
END N5_PACKAGE;