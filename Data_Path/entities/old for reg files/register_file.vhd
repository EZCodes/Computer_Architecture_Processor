----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 13:28:53
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
    Port ( src_S0 : in STD_LOGIC_VECTOR (2 downto 0);
           src_S1 : in STD_LOGIC_VECTOR (2 downto 0);
           dst_1 : in STD_LOGIC;
           dst_2 : in STD_LOGIC;
           dst_3 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_new : in STD_LOGIC_VECTOR (15 downto 0);
           Reset: in STD_LOGIC;
           Load_enable: in STD_LOGIC;
           Data_b : out STD_LOGIC_VECTOR (15 downto 0);
           Data_a : out STD_LOGIC_VECTOR (15 downto 0));
end register_file;

architecture Behavioral of register_file is
    component eight_registers is
        Port( D : in STD_LOGIC_VECTOR(15 downto 0);
           Clk :in STD_LOGIC;
           Reset : in STD_LOGIC;
           L0 : in STD_LOGIC;
           L1 : in STD_LOGIC;
           L2 : in STD_LOGIC;
           L3 : in STD_LOGIC;
           L4 : in STD_LOGIC;
           L5 : in STD_LOGIC;
           L6 : in STD_LOGIC;
           L7 : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR(15 downto 0);
           R1 : out STD_LOGIC_VECTOR(15 downto 0);
           R2 : out STD_LOGIC_VECTOR(15 downto 0);
           R3 : out STD_LOGIC_VECTOR(15 downto 0);
           R4 : out STD_LOGIC_VECTOR(15 downto 0);
           R5 : out STD_LOGIC_VECTOR(15 downto 0);
           R6 : out STD_LOGIC_VECTOR(15 downto 0);
           R7 : out STD_LOGIC_VECTOR(15 downto 0)       
        );
    end component;

    component eight_to_one_mux is
        Port(
           Sel : in STD_LOGIC_VECTOR(2 downto 0);
           Reg1 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg2 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg3 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg4 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg5 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg6 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg7 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg8 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    component three_to_eight_dec is
        Port(
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           R0 : out STD_LOGIC;
           R1 : out STD_LOGIC;
           R2 : out STD_LOGIC;
           R3 : out STD_LOGIC;
           R4 : out STD_LOGIC;
           R5 : out STD_LOGIC;
           R6 : out STD_LOGIC;
           R7 : out STD_LOGIC       
        );   
    end component;
    
    signal Load0 : STD_LOGIC;
    signal Load1 : STD_LOGIC;
    signal Load2 : STD_LOGIC;
    signal Load3 : STD_LOGIC;
    signal Load4 : STD_LOGIC;
    signal Load5 : STD_LOGIC;
    signal Load6 : STD_LOGIC;
    signal Load7 : STD_LOGIC;
    signal R0 : STD_LOGIC_VECTOR(15 downto 0);
    signal R1 : STD_LOGIC_VECTOR(15 downto 0);
    signal R2 : STD_LOGIC_VECTOR(15 downto 0);
    signal R3 : STD_LOGIC_VECTOR(15 downto 0);
    signal R4 : STD_LOGIC_VECTOR(15 downto 0);
    signal R5 : STD_LOGIC_VECTOR(15 downto 0);
    signal R6 : STD_LOGIC_VECTOR(15 downto 0);
    signal R7 : STD_LOGIC_VECTOR(15 downto 0);
    signal EL0 : STD_LOGIC;
    signal EL1 : STD_LOGIC;
    signal EL2 : STD_LOGIC;
    signal EL3 : STD_LOGIC;
    signal EL4 : STD_LOGIC;
    signal EL5 : STD_LOGIC;
    signal EL6 : STD_LOGIC;
    signal EL7 : STD_LOGIC;

begin
    registers: eight_registers port map(
            D => Data_new,
            Clk => Clk,
            Reset => Reset,
            L0 => EL0,
            L1 => EL1,
            L2 => EL2,
            L3 => EL3,
            L4 => EL4,
            L5 => EL5,
            L6 => EL6,
            L7 => EL7,
            R0 => R0,
            R1 => R1,
            R2 => R2,
            R3 => R3,
            R4 => R4,
            R5 => R5,
            R6 => R6,
            R7 => R7
    );
    ETO_mux: eight_to_one_mux port map(
           Sel => src_S0,
           Reg1 => R0,
           Reg2 => R1,
           Reg3 => R2,
           Reg4 => R3,
           Reg5 => R4,
           Reg6 => R5,
           Reg7 => R6,
           Reg8 => R7,
           Z => Data_a
    );
    ETO_mux_b: eight_to_one_mux port map(
           Sel => src_S1,
           Reg1 => R0,
           Reg2 => R1,
           Reg3 => R2,
           Reg4 => R3,
           Reg5 => R4,
           Reg6 => R5,
           Reg7 => R6,
           Reg8 => R7,
           Z => Data_b
    );
    TTE_decoder: three_to_eight_dec port map(
           S0 => dst_3,
           S1 => dst_2,
           S2 => dst_1,
           R0 => Load0,
           R1 => Load1,
           R2 => Load2,
           R3 => Load3,
           R4 => Load4,
           R5 => Load5,
           R6 => Load6,
           R7 => Load7
    );
    
    EL0 <= Load_enable and Load0 after 1ns;
    EL1 <= Load_enable and Load1 after 1ns;
    EL2 <= Load_enable and Load2 after 1ns;
    EL3 <= Load_enable and Load3 after 1ns;
    EL4 <= Load_enable and Load4 after 1ns;
    EL5 <= Load_enable and Load5 after 1ns;
    EL6 <= Load_enable and Load6 after 1ns;
    EL7 <= Load_enable and Load7 after 1ns;

end Behavioral;
