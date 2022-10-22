library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


ENTITY FullSubtractor8bit IS --- Full Subtractor
PORT(a_vec,b_vec: IN std_logic_vector(0 to 7);
D : OUT std_logic_vector(0 to 7);
bout : OUT std_logic);
END FullSubtractor8bit;




ARCHITECTURE FullSubtractor8bit_Structure OF FullSubtractor8bit IS

component HalfSubtractor  --- Half Subtractor


PORT(a,b: IN std_logic;
diff, borr : OUT std_logic);
END component;

component FullSubtractor  --- Full Subtractor
PORT(a,b,bin: IN std_logic;
 
 D,bout : OUT std_logic);

END component;



signal borr: std_logic_vector(0 to 6);

BEGIN

HS0: HalfSubtractor port map(a_vec(7),b_vec(7),D(7),borr(0));
FS1: FullSubtractor port map(a_vec(6),b_vec(6),borr(0),D(6),borr(1));
FS2: FullSubtractor port map(a_vec(5),b_vec(5),borr(1),D(5),borr(2));
FS3: FullSubtractor port map(a_vec(4),b_vec(4),borr(2),D(4),borr(3));
FS4: FullSubtractor port map(a_vec(3),b_vec(3),borr(3),D(3),borr(4));
FS5: FullSubtractor port map(a_vec(2),b_vec(2),borr(4),D(2),borr(5));
FS6: FullSubtractor port map(a_vec(1),b_vec(1),borr(5),D(1),borr(6));
FS7: FullSubtractor port map(a_vec(0),b_vec(0),borr(6),D(0),bout);




End FullSubtractor8bit_Structure;
