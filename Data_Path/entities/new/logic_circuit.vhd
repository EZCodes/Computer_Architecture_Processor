----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2019 13:17:19
-- Design Name: 
-- Module Name: logic_circuit - Behavioral
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

entity logic_circuit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC);
end logic_circuit;

architecture Behavioral of logic_circuit is
    component four_to_one_mux is
        Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           X3 : in STD_LOGIC;
           Z1 : out STD_LOGIC);   
    end component;
    
    signal and_gate : STD_LOGIC;
    signal or_gate : STD_LOGIC;
    signal xor_gate : STD_LOGIC;
    signal not_gate : STD_LOGIC;

begin
    FTO_mux : four_to_one_mux port map(
        S0 => S0,
        S1 => S1,
        X0 => and_gate,
        X1 => or_gate,
        X2 => xor_gate,
        X3 => not_gate,
        Z1 => G
        );
        
    and_gate <= A and B after 1ns;
    or_gate <= A or B after 1ns;
    xor_gate <= A xor B after 1ns;
    not_gate <= not A after 1ns;

end Behavioral;
