ECM

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



ENTITY ECM IS

PORT(z1,z2,z3: IN std_logic_vector (0 to 7) ;
 z31_valid, z32_valid: OUT std_logic);
 
END ECM  ;



ARCHITECTURE ECM_beh OF ECM   IS

COMPONENT MUX
PORT(x,y: IN std_logic_vector(7 downto 0);
s: IN std_logic;
mux_out: OUT std_logic_vector(7 downto 0) );

END COMPONENT ;

COMPONENT Comparator
PORT(x,y: IN std_logic_vector(7 downto 0);
comp_out: OUT std_logic) ;

END COMPONENT;


COMPONENT FullSubtractor8bit
PORT(a_vec,b_vec: IN std_logic_vector(0 to 7);
D : OUT std_logic_vector(0 to 7);
bout : OUT std_logic);
END COMPONENT;


signal s1,s2,Nots1, Nots2, Bout1,Bout2,n1,n2,n3,n4: std_logic;
signal out1,out2,out3,out4,z31,z32: std_logic_vector(0 to 7);

BEGIN

COMP1: Comparator port map(z1,z3,s1);
COMP2: Comparator port map(z2,z3,s2);

MUX1: MUX port map(z1,z3,s1,out1);
NOts1 <= NOT s1;
MUX2: MUX port map(z1,z3,NOTs1,out2);

MUX3: MUX port map(z2,z3,s2,out3);

NOts2 <= NOT s2;
MUX4: MUX port map(z2,z3,NOTs2,out4);

SUB1: FullSubtractor8bit port map(out1,out2,z31,Bout1);
SUB2: FullSubtractor8bit port map(out3,out4,z32,Bout2);

n1 <= (((z31(7) NOR z31(6)) NOR z31(5)) NOR z31(4)) NOR z31(3);
n2 <= (z31(2) NAND z31(1)) NAND z31(0);


n3 <= (((z32(7) NOR z32(6)) NOR z32(5)) NOR z32(4)) NOR z32(3);
n4 <= (z32(2) NAND z32(1)) NAND z32(0);


z31_valid <= n1 AND n2;
z32_valid <= n3 AND n4;




END ECM_beh ;
