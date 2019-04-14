----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2019 17:26:37
-- Design Name: 
-- Module Name: two_to_one_mux - Behavioral
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

entity two_to_one_mux is
    Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
end two_to_one_mux;

architecture Behavioral of two_to_one_mux is
begin
    Z <= D0 after 5ns when Sel ='0' else
         D1 after 5ns when Sel ='1' else
         x"FFFF" after 5ns;
end Behavioral;
