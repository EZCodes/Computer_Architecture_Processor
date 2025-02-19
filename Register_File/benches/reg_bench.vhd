----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2019 13:50:54
-- Design Name: 
-- Module Name: reg_bench - Behavioral
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

entity reg_bench is
--  Port ( );
end reg_bench;

architecture Behavioral of reg_bench is
    component reg is
    Port ( D : in STD_LOGIC_VECTOR(15 downto 0);
           Clk : in STD_LOGIC;
           Load : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(15 downto 0);
           Reset: in STD_LOGIC
           );
    end component;
    
    -- inputs
    signal D: STD_LOGIC_VECTOR(15 downto 0) := x"0000";
    signal Clk : STD_LOGIC := '0';
    signal Load : STD_LOGIC := '0';
    signal Reset: STD_LOGIC := '1';
    -- outputs
    signal Q : STD_LOGIC_VECTOR(15 downto 0);
    
    constant TIME_CYCLE: time := 15 ns;
    
            
begin
    uut: reg port map(
        D => D,
        Clk => Clk,
        Load => Load,
        Q => Q,
        Reset => Reset
        );
    clock : process
    begin
        wait for TIME_CYCLE/2;
        Clk <= not Clk;
    end process;
    
    simul : process
        begin
            wait for TIME_CYCLE;
            Reset <= '0';
            D <= x"0001";
            Load <= '1';
            wait for TIME_CYCLE;
            Load <= '0';
            D <= x"0010";
            wait for TIME_CYCLE;
            D <= x"1100";
            Load <= '1';
            wait for TIME_CYCLE;
        end process;
        
end Behavioral;
