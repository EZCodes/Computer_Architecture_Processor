----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 20:39:19
-- Design Name: 
-- Module Name: register_file_bench - Behavioral
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

entity register_file_bench is
--  Port ( );
end register_file_bench;

architecture Behavioral of register_file_bench is
    component register_file is
    Port ( src_S0 : in STD_LOGIC_VECTOR (2 downto 0);
           dst_1 : in STD_LOGIC;
           dst_2 : in STD_LOGIC;
           dst_3 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_new : in STD_LOGIC_VECTOR (15 downto 0);
           Data_select : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Load_enable: in STD_LOGIC;
           Reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
     signal src_S0 : STD_LOGIC_VECTOR (2 downto 0);
     signal dst_1 : STD_LOGIC;
     signal dst_2 : STD_LOGIC;
     signal dst_3 : STD_LOGIC;
     signal Clk : STD_LOGIC;
     signal Data_new : STD_LOGIC_VECTOR (15 downto 0);
     signal Data_select : STD_LOGIC;
     signal Reset: STD_LOGIC;
     signal Load_enable: STD_LOGIC;
     signal Reg0 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg1 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg3 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg4 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg5 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg6 : STD_LOGIC_VECTOR (15 downto 0);
     signal Reg7 : STD_LOGIC_VECTOR (15 downto 0); 
    
     constant TIME_CYCLE: time := 15 ns;
begin




clock: process   
    begin
    wait for TIME_CYCLE/2;
        Clk <= not Clk;
    end process;
    
simul: process
    begin

    end process;

end Behavioral;
