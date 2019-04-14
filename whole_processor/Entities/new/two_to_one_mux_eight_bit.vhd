----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2019 11:37:30
-- Design Name: 
-- Module Name: two_to_one_mux_eight_bit - Behavioral
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

entity two_to_one_mux_eight_bit is
    Port ( Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Z : out STD_LOGIC_VECTOR(7 downto 0));
end two_to_one_mux_eight_bit;

architecture Behavioral of two_to_one_mux_eight_bit is

begin
    Z <= A after 1ns when Sel ='0' else
         B after 1ns when Sel ='1' else
         x"00" after 1ns;

end Behavioral;
