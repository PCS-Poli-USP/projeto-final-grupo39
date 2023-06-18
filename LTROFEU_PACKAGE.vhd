LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

PACKAGE LTROFEU_PACKAGE IS
PROCEDURE LTROFEU(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);
END LTROFEU_PACKAGE;

PACKAGE BODY LTROFEU_PACKAGE IS
PROCEDURE LTROFEU(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS
CONSTANT size : INTEGER := 6;

BEGIN

 IF (EN_DRAW = '1') AND ((((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 0*SIZE) AND (Ycur < Ypos + 1*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 1*SIZE) AND (Ycur < Ypos + 2*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 1*SIZE) AND (Xcur < Xpos + 2*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 2*SIZE) AND (Xcur < Xpos + 3*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 10*SIZE) AND (Xcur < Xpos + 11*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 11*SIZE) AND (Xcur < Xpos + 12*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 12*SIZE) AND (Xcur < Xpos + 13*SIZE)) AND ((Ycur >= Ypos + 2*SIZE) AND (Ycur < Ypos + 3*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 12*SIZE) AND (Xcur < Xpos + 13*SIZE)) AND ((Ycur >= Ypos + 3*SIZE) AND (Ycur < Ypos + 4*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 12*SIZE) AND (Xcur < Xpos + 13*SIZE)) AND ((Ycur >= Ypos + 4*SIZE) AND (Ycur < Ypos + 5*SIZE))) OR 
                (((Xcur >= Xpos + 0*SIZE) AND (Xcur < Xpos + 1*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 12*SIZE) AND (Xcur < Xpos + 13*SIZE)) AND ((Ycur >= Ypos + 5*SIZE) AND (Ycur < Ypos + 6*SIZE))) OR 
                (((Xcur >= Xpos + 1*SIZE) AND (Xcur < Xpos + 2*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 2*SIZE) AND (Xcur < Xpos + 3*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 10*SIZE) AND (Xcur < Xpos + 11*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 11*SIZE) AND (Xcur < Xpos + 12*SIZE)) AND ((Ycur >= Ypos + 6*SIZE) AND (Ycur < Ypos + 7*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 7*SIZE) AND (Ycur < Ypos + 8*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 8*SIZE) AND (Ycur < Ypos + 9*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 8*SIZE) AND (Ycur < Ypos + 9*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 8*SIZE) AND (Ycur < Ypos + 9*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 8*SIZE) AND (Ycur < Ypos + 9*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 8*SIZE) AND (Ycur < Ypos + 9*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 9*SIZE) AND (Ycur < Ypos + 10*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 9*SIZE) AND (Ycur < Ypos + 10*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 9*SIZE) AND (Ycur < Ypos + 10*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 10*SIZE) AND (Ycur < Ypos + 11*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 10*SIZE) AND (Ycur < Ypos + 11*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 10*SIZE) AND (Ycur < Ypos + 11*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 11*SIZE) AND (Ycur < Ypos + 12*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 11*SIZE) AND (Ycur < Ypos + 12*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 11*SIZE) AND (Ycur < Ypos + 12*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 12*SIZE) AND (Ycur < Ypos + 13*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 12*SIZE) AND (Ycur < Ypos + 13*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 12*SIZE) AND (Ycur < Ypos + 13*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 12*SIZE) AND (Ycur < Ypos + 13*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 12*SIZE) AND (Ycur < Ypos + 13*SIZE))) OR 
                (((Xcur >= Xpos + 3*SIZE) AND (Xcur < Xpos + 4*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 4*SIZE) AND (Xcur < Xpos + 5*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 5*SIZE) AND (Xcur < Xpos + 6*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 6*SIZE) AND (Xcur < Xpos + 7*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 7*SIZE) AND (Xcur < Xpos + 8*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 8*SIZE) AND (Xcur < Xpos + 9*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE))) OR 
                (((Xcur >= Xpos + 9*SIZE) AND (Xcur < Xpos + 10*SIZE)) AND ((Ycur >= Ypos + 13*SIZE) AND (Ycur < Ypos + 14*SIZE)))) THEN
	 R<="1111";
	 G<="1111";
	 B<="1111";
	 DRAW<='1';
	 ELSE
	 DRAW<='0';
 END IF;

END LTROFEU;
END LTROFEU_PACKAGE;