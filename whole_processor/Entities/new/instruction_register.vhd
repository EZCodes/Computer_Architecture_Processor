----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2019 11:19:01
-- Design Name: 
-- Module Name: instruction_register - Behavioral
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

entity instruction_register is
    Port( Inst_in : in STD_LOGIC_VECTOR (15 downto 0);
          IL : in STD_LOGIC;
          Opcode : out STD_LOGIC_VECTOR (7 downto 0);
          DR: out STD_LOGIC_VECTOR (2 downto 0);
          SA: out STD_LOGIC_VECTOR (2 downto 0);
          SB: out STD_LOGIC_VECTOR (2 downto 0);
          Clk: in STD_LOGIC;
          Reset: in STD_LOGIC
    );
end instruction_register;

architecture Behavioral of instruction_register is
    signal state : STD_LOGIC_VECTOR (15 downto 0);
begin
    Opcode(6 downto 0) <= state(15 downto 9) after 1ns;
    DR <= state(8 downto 6) after 1ns;
    SA <= state(5 downto 3) after 1ns;
    SB <= state(2 downto 0) after 1ns;
    Opcode(7) <= '0'; 
    process(Clk, Reset)
    begin
        if(Reset = '1') then
            state <= x"0000";
        elsif(Clk ='1' and IL = '1') then 
            state <= Inst_in;
        end if;
    end process;
 
end Behavioral;
