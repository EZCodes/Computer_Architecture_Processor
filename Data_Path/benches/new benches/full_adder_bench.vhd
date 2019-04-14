----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2019 12:32:38
-- Design Name: 
-- Module Name: full_adder_bench - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_bench is
end;

architecture bench of full_adder_bench is

  component full_adder
      Port ( X : in STD_LOGIC;
             Y : in STD_LOGIC;
             Cin : in STD_LOGIC;
             S : out STD_LOGIC;
             Cout : out STD_LOGIC);
  end component;

  -- inputs
  signal X: STD_LOGIC := '0';
  signal Y: STD_LOGIC := '0';
  signal Cin: STD_LOGIC := '0';
  
  -- outputs
  signal S: STD_LOGIC;
  signal Cout: STD_LOGIC;
    
  constant TIME_PERIOD: time:= 15 ns;
  
begin

  uut: full_adder port map ( 
    X => X,
    Y => Y,
    Cin => Cin,
    S => S,
    Cout => Cout );

  stimul: process
    begin
        wait for TIME_PERIOD;
        X <= '1';
        wait for TIME_PERIOD;
        Y <= '1';
        wait for TIME_PERIOD;
        X <= '0';
        wait for TIME_PERIOD;
        Cin <= '1';
        wait for TIME_PERIOD;
        X <= '1';
        wait for TIME_PERIOD;
        Y <= '0';
        wait for TIME_PERIOD;
        X <= '0';
        wait;
    end process;

end;
