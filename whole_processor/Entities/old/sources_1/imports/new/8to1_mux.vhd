----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2019 15:52:53
-- Design Name: 
-- Module Name: 8to1_mux - Behavioral
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

entity eight_to_one_mux is
    Port ( Sel : in STD_LOGIC_VECTOR(2 downto 0);
           Reg1 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg2 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg3 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg4 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg5 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg6 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg7 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg8 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end eight_to_one_mux;

architecture Behavioral of eight_to_one_mux is

begin
    Z <= Reg1 after 5ns when Sel = "000" else
         Reg2 after 5ns when Sel = "001" else
         Reg3 after 5ns when Sel = "010" else
         Reg4 after 5ns when Sel = "011" else
         Reg5 after 5ns when Sel = "100" else
         Reg6 after 5ns when Sel = "101" else
         Reg7 after 5ns when Sel = "110" else
         Reg8 after 5ns when Sel = "111" else
         x"0000" after 5ns;
        
end Behavioral;
