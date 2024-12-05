LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE LN_PACKAGE IS
PROCEDURE LN(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END LN_PACKAGE;

PACKAGE BODY LN_PACKAGE IS
PROCEDURE LN(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS
CONSTANT size : INTEGER := 6;

BEGIN

 IF (EN_DRAW = '1') AND ((((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 1*SIZE) AND (Xcur < Xpos + 2*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 2*SIZE) AND (Xcur < Xpos + 3*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE)))) THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;

END LN;
END LN_PACKAGE;