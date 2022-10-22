library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
ENTITY Comparator IS
PORT(x,y: IN std_logic_vector(7 downto 0);
comp_out: OUT std_logic) ;

END Comparator;

ARCHITECTURE Comparator_St OF Comparator IS
signal yn, o, e: std_logic_vector(7 downto 0);
signal  oh, ol, oe: std_logic;

BEGIN
yn<= NOT y;
e<= y XNOR x;

o(7)<= yn(7) AND x(7);
o(6)<= yn(6) AND x(6) AND e(7);
o(5)<= yn(5) AND x(5) AND e(7) AND e(6);
o(4)<= yn(4) AND x(4) AND e(7) AND e(6) AND e(5);
oh<= o(7) OR o(6) OR o(5) OR o(4);

o(3)<= yn(3) AND x(3);
o(2)<= yn(2) AND x(2) AND e(3) ;
o(1)<= yn(1) AND x(1) AND e(3) AND e(2);
o(0)<= yn(0) AND x(0) AND e(3) AND e(2) AND e(1);
ol<= o(3) OR o(2) OR o(1) OR o(0);

oe<= e(7) AND e(6) AND e(5) AND e(4);

comp_out<= oh OR (ol AND oe);


END Comparator_St;
