library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
ENTITY MUX IS
PORT(x,y: IN std_logic_vector(7 downto 0);
s: IN std_logic;
mux_out: OUT std_logic_vector(7 downto 0) );

END MUX;

ARCHITECTURE MUX_St OF MUX IS
signal xand, yand: std_logic_vector(7 downto 0);
signal  nots: std_logic;

BEGIN

nots<= NOT s;
xand(0)<= x(0) AND s;
xand(1)<= x(1) AND s;
xand(2)<= x(2) AND s;
xand(3)<= x(3) AND s;
xand(4)<= x(4) AND s;
xand(5)<= x(5) AND s;
xand(6)<= x(6) AND s;
xand(7)<= x(7) AND s;

yand(0)<= y(0) AND nots;
yand(1)<= y(1) AND nots;
yand(2)<= y(2) AND nots;
yand(3)<= y(3) AND nots;
yand(4)<= y(4) AND nots;
yand(5)<= y(5) AND nots;
yand(6)<= y(6) AND nots;
yand(7)<= y(7) AND nots;

mux_out<= xand OR yand;

END MUX_St;
