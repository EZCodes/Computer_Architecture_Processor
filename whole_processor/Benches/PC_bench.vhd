----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 22:12:31
-- Design Name: 
-- Module Name: PC_bench - Behavioral
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

entity program_counter_bench is
end;

architecture behav of program_counter_bench is

  component program_counter
    Port ( PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Displacement : in STD_LOGIC_VECTOR (15 downto 0);
           Instr_out : out STD_LOGIC_VECTOR (15 downto 0);
           Reset: in STD_LOGIC
           );
  end component;

  signal PL: STD_LOGIC := '0';
  signal PI: STD_LOGIC := '0';
  signal Clk: STD_LOGIC := '0';
  signal Displacement: STD_LOGIC_VECTOR (15 downto 0) := x"0A3F";
  signal Instr_out: STD_LOGIC_VECTOR (15 downto 0) ;
  signal Reset: STD_LOGIC := '1' ;

  signal TIME_CYCLE : time := 400ns;
begin
  
  uut: program_counter port map ( PL           => PL,
                                  PI           => PI,
                                  Clk          => Clk,
                                  Displacement => Displacement,
                                  Instr_out    => Instr_out,
                                  Reset        => Reset );
  clock : process
  begin
    wait for TIME_CYCLE/2;
    Clk <= not Clk;
  end process;
  
  stim: process
  begin
    wait for TIME_CYCLE;
    Reset <= '0';
    wait for TIME_CYCLE;
    PI <= '1';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    PI <= '0';
    PL <= '1';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    PL <= '0';
    PI <= '1';
    wait for TIME_CYCLE;
    wait;
  end process;


end behav;
