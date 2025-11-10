----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:24:36 10/28/2025 
-- Design Name: 
-- Module Name:    stack_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack_top is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           btns : in  STD_LOGIC_VECTOR (15 downto 0);
           leds : out  STD_LOGIC_VECTOR (15 downto 0));
end stack_top;

architecture Behavioral of stack_top is

component div_27 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component mux_pc_4_1 is
    Port ( I : in  STD_LOGIC_VECTOR (47 downto 0);
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;			  
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component program_c is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_pc : in  STD_LOGIC_VECTOR (15 downto 0);
           O_pc : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component pc_sum is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           suma : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal clk_27 : STD_LOGIC;
signal i_pc_aux, o_pc_aux, norm_pc_aux: STD_LOGIC_VECTOR(15 downto 0);
signal mux_aux :  STD_LOGIC_VECTOR(47 downto 0) := (others => '0');

begin
	
	divs_27: div_27 port map (clk=>clk,clr=>clr,q=>clk_27);
	mux_4_1: mux_pc_4_1 port map(I=>mux_aux,s1=>s1,s0=>s0,O=>i_pc_aux);
	pc : program_c port map(clk=>clk_27,clr=>clr,I_pc=>i_pc_aux,O_pc=>o_pc_aux);
	sum_pc : pc_sum port map(A=>x"0001",B=>o_pc_aux,suma=>norm_pc_aux);

	mux_aux <= ("0000111100001111" & btns & norm_pc_aux);
	
	leds<=o_pc_aux;

end Behavioral;

