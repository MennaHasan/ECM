library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


ENTITY FullSubtractor IS --- Full Subtractor
PORT(a,b,bin: IN std_logic;
 
 D,bout : OUT std_logic);
END FullSubtractor;


ARCHITECTURE FullSubtractor_Structure OF FullSubtractor IS

component HalfSubtractor   --- Half Subtractor


PORT(a,b: IN std_logic;
diff, borr : OUT std_logic);
END component;


signal borr1,diff, borr2: std_logic;

BEGIN

HS0: HalfSubtractor port map(a,b,diff, borr1);
HS1: HalfSubtractor port map(diff,bin, D, borr2);

bout<= borr1 or borr2;


End FullSubtractor_Structure;
