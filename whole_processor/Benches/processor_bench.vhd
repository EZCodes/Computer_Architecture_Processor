----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 11:10:48
-- Design Name: 
-- Module Name: processor_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity processor_bench is
end;

architecture behav of processor_bench is

  component processor
    Port ( 
          Clk: in STD_LOGIC;
          Reset: in STD_LOGIC
    );
  end component;

  signal Clk: STD_LOGIC := '1';
  signal Reset: STD_LOGIC := '1' ;
  
  signal TIME_CYCLE : time := 300ns;

begin

  uut: processor port map ( Clk   => Clk,
                            Reset => Reset );
  clock: process
  begin
    WAIT FOR TIME_CYCLE/2;
    Clk <= not Clk;
  end process;
  stim: process
  begin
    wait for TIME_CYCLE;
    Reset <= '0';
    wait;
  end process;


end behav;



