----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 23:09:52
-- Design Name: 
-- Module Name: IR_bench - Behavioral
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

entity instruction_register_bench is
end;

architecture behav of instruction_register_bench is

  component instruction_register
      Port( Inst_in : in STD_LOGIC_VECTOR (15 downto 0);
            IL : in STD_LOGIC;
            Opcode : out STD_LOGIC_VECTOR (6 downto 0);
            DR: out STD_LOGIC_VECTOR (2 downto 0);
            SA: out STD_LOGIC_VECTOR (2 downto 0);
            SB: out STD_LOGIC_VECTOR (2 downto 0);
            Clk: in STD_LOGIC;
            Reset: in STD_LOGIC
      );
  end component;

  signal Inst_in: STD_LOGIC_VECTOR (15 downto 0) := x"F81B";
  signal IL: STD_LOGIC := '0';
  signal Opcode: STD_LOGIC_VECTOR (6 downto 0);
  signal DR: STD_LOGIC_VECTOR (2 downto 0);
  signal SA: STD_LOGIC_VECTOR (2 downto 0);
  signal SB: STD_LOGIC_VECTOR (2 downto 0);
  signal Clk: STD_LOGIC := '0';
  signal Reset: STD_LOGIC := '1' ;

  signal TIME_CYCLE: time := 200ns;
begin

  uut: instruction_register port map ( Inst_in => Inst_in,
                                       IL      => IL,
                                       Opcode  => Opcode,
                                       DR      => DR,
                                       SA      => SA,
                                       SB      => SB,
                                       Clk     => Clk,
                                       Reset   => Reset );

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
    IL <= '1';
    wait for TIME_CYCLE;
    IL <= '0';
    wait for TIME_CYCLE;
    Inst_in <= x"BEEF";
    wait for TIME_CYCLE;
    IL <= '1';
    wait for TIME_CYCLE;
    IL <= '0';
    wait;
  end process;


end behav;