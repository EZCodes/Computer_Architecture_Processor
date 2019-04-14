----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2019 13:42:58
-- Design Name: 
-- Module Name: half_adder_bench - Behavioral
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


entity half_adder_bench is 
end half_adder_bench;

architecture Behavioral of half_adder_bench is

component half_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;
    -- inputs
    signal A: STD_LOGIC :='0';
    signal B: STD_LOGIC :='0';
    
    -- outputs
    signal S: STD_LOGIC;
    signal Carry: STD_LOGIC;
    
    
    constant TIME_PERIOD: time:= 20 ns;

begin

    uut: half_adder port map(
        A=>A,
        B=>B,
        S=>S,
        Carry => Carry
    );
    
    simul: process
        begin
            wait for TIME_PERIOD;
            A <= '1';
            wait for TIME_PERIOD;
            B <= '1';
            wait for TIME_PERIOD;
            A <= '0';
            wait for TIME_PERIOD;
        end process;
        


end Behavioral;
