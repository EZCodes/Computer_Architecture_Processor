----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2019 15:02:24
-- Design Name: 
-- Module Name: two_to_one_mux_one_bit - Behavioral
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

entity two_to_one_mux_one_bit is
    Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           Z : out STD_LOGIC;
           Sel : in STD_LOGIC);
end two_to_one_mux_one_bit;

architecture Behavioral of two_to_one_mux_one_bit is
begin
    Z <= D0 after 1ns when Sel ='0' else
         D1 after 1ns when Sel ='1' else
         '0' after 1ns;
end Behavioral;
