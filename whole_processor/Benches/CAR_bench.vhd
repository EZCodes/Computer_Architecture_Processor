----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 23:20:42
-- Design Name: 
-- Module Name: CAR_bench - Behavioral
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

entity control_address_register_bench is
end;

architecture behav of control_address_register_bench is

  component control_address_register
      Port ( 
          Opcode : in STD_LOGIC_VECTOR(7 downto 0);
          Next_instruction : out STD_LOGIC_VECTOR (7 downto 0);
          Sel_S : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Reset: in STD_LOGIC
      );
  end component;

  signal Opcode: STD_LOGIC_VECTOR(7 downto 0) := x"22";
  signal Next_instruction: STD_LOGIC_VECTOR (7 downto 0) := x"00";
  signal Sel_S: STD_LOGIC := '0';
  signal Clk: STD_LOGIC := '0';
  signal Reset: STD_LOGIC := '1' ;

  signal TIME_CYCLE : time := 200ns;
begin

  uut: control_address_register port map ( Opcode           => Opcode,
                                           Next_instruction => Next_instruction,
                                           Sel_S            => Sel_S,
                                           Clk              => Clk,
                                           Reset            => Reset );

  clock : process
  begin
    wait for TIME_CYCLE;
    Clk <= not Clk;
  end process;
  stim: process
  begin
    wait for TIME_CYCLE;
    Reset <= '0';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    Sel_S <= '1';
    wait for TIME_CYCLE;
    Sel_S <= '0';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    wait;
  end process;


end behav;
