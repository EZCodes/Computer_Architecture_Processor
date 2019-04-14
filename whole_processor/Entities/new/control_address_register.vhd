----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2019 11:24:28
-- Design Name: 
-- Module Name: control_address_register - Behavioral
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

entity control_address_register is
    Port ( 
        Opcode : in STD_LOGIC_VECTOR(7 downto 0);
        Next_instruction : out STD_LOGIC_VECTOR (7 downto 0);
        Sel_S : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset: in STD_LOGIC
    );
end control_address_register;

architecture Behavioral of control_address_register is
       component sixteen_bit_ALU is
        Port(   
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
       end component;
       signal ALU_control : STD_LOGIC_VECTOR (3 downto 0) := "0010"; -- always on add
       signal state : STD_LOGIC_VECTOR (7 downto 0);
       
       signal ALU_input : STD_LOGIC_VECTOR ( 15 downto 0) := x"0001";
       signal ALU_output : STD_LOGIC_VECTOR(15 downto 0);
       
       signal zero_fill : STD_LOGIC_VECTOR(7 downto 0) := x"00";
       
begin
    alu : sixteen_bit_ALU port map(
       A(7 downto 0) => state ,
       A(15 downto 8) => zero_fill,
       B => ALU_input,
       S0 => ALU_control(1),
       Cin => ALU_control(0),
       S1 => ALU_control(2),
       S2 => ALU_control(3),
       Sum => ALU_output
    );
    Next_instruction <= state after 1ns;
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"00";
        elsif(Clk = '1' and Sel_S = '0') then
            state <= ALU_output (7 downto 0);
        elsif(Clk = '1' and Sel_S = '1') then
            state <= Opcode;
        end if;
    end process;
        
            

end Behavioral;
