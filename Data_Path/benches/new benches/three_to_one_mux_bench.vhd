----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 20:49:51
-- Design Name: 
-- Module Name: three_to_one_mux_bench - Behavioral
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

entity three_to_one_mux_bench is
--  Port ( );
end three_to_one_mux_bench;

architecture Behavioral of three_to_one_mux_bench is

component three_to_one_mux
      Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
             X0 : in STD_LOGIC;
             X1 : in STD_LOGIC;
             X2 : in STD_LOGIC;
             Z : out STD_LOGIC);
  end component;

  -- input
  signal S: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal X0: STD_LOGIC := '1';
  signal X1: STD_LOGIC := '1';
  signal X2: STD_LOGIC := '1';
  -- output
  signal Z: STD_LOGIC;
  
  constant TIME_CYCLE: time := 10ns;

begin

  uut: three_to_one_mux port map ( 
        S  => S,
        X0 => X0,
        X1 => X1,
        X2 => X2,
        Z  => Z 
   );

  stimul: process
     begin
        wait for TIME_CYCLE;
        X0 <= '0';
        wait for TIME_CYCLE;
        S <= "01";
        wait for TIME_CYCLE;
        X1 <= '0';
        wait for TIME_CYCLE;
        S <= "10";
        wait for TIME_CYCLE;
        X2 <= '0';
        wait;
  end process;
end Behavioral;
