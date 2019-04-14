----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2019 17:47:45
-- Design Name: 
-- Module Name: TT0_mux_bench - Behavioral
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

entity TT0_mux_bench is
--  Port ( );
end TT0_mux_bench;

architecture Behavioral of TT0_mux_bench is

component two_to_one_mux is
    Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
end component;

    -- input
    signal D0 : STD_LOGIC_VECTOR(15 downto 0) := x"45A1";
    signal D1 : STD_LOGIC_VECTOR(15 downto 0) := x"00F0";
    signal Sel : STD_LOGIC := '0';
    
    -- output
    signal Z : STD_LOGIC_VECTOR(15 downto 0);
    
    constant TIME_CYCLE: time := 15ns;
    
begin
    uut: two_to_one_mux port map(
    D0 => D0,
    D1 => D1,
    Z => Z,
    Sel => Sel
    );
    
    simul: process
    begin
        wait for TIME_CYCLE;
        Sel <= '1';
        wait for TIME_CYCLE;
        Sel <= '0';
    end process;
end Behavioral;
