library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


-- the half subtractor
-- performs a- b
-- outputs difference and borrow


ENTITY HalfSubtractor IS --- Half Subtractor

PORT(a,b: IN std_logic;
 diff, borr: OUT std_logic);
 
END HalfSubtractor  ;

ARCHITECTURE HalfSubtractor_beh   OF HalfSubtractor   IS

signal NOTa: std_logic;
BEGIN

diff <= a XOR b; -- Implements borrow for Half Subtractor

NOTa <= NOT a;
borr <= b AND NOTa; -- Implements difference for Half Subtractor



END HalfSubtractor_beh ;
