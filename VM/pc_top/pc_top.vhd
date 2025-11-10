----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:43 11/03/2025 
-- Design Name: 
-- Module Name:    pc_top - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_top is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           btns : in  STD_LOGIC_VECTOR (15 downto 0);
           leds : out  STD_LOGIC_VECTOR (15 downto 0));
end pc_top;

architecture Behavioral of pc_top is

component div_27 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component program_c is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_pc : in  STD_LOGIC_VECTOR (15 downto 0);
           O_pc : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component stack_pointer is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_sp : in  STD_LOGIC_VECTOR (3 downto 0);
           O_sp : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component RAM is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  WE : in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal i_pc_aux,o_pc_aux,norm_pc_aux,rd_aux : STD_LOGIC_VECTOR (15 downto 0);
signal i_sp_aux,o_sp_aux,o_sp_ret_aux,call_aux,ret_aux : STD_LOGIC_VECTOR (3 downto 0);
signal clk27 : STD_LOGIC;

begin

	--Multiplexores
	i_pc_aux<=norm_pc_aux when s1='0' AND s0='0' else
				 btns when s1='0' AND s0='1' else
				 rd_aux;
	
	i_sp_aux<=o_sp_aux when s1='0' AND s0='0' else
				 call_aux when s1='0' AND s0='1' else
				 ret_aux;
				 
	o_sp_ret_aux<=o_sp_aux when s1='0' else
					  ret_aux;	
				 
	--Sumadores
	norm_pc_aux<=STD_LOGIC_VECTOR(unsigned(o_pc_aux) + 1);--to_unsigned(x"0001");
	call_aux<=STD_LOGIC_VECTOR(unsigned(o_sp_aux) - 2);--to_unsigned("0010");
	ret_aux<=STD_LOGIC_VECTOR(unsigned(o_sp_aux) + 2);--to_unsigned("0010");
	
	
clk_27 : div_27 port map (clk=>clk,clr=>clr,q=>clk27);	
PC : program_C port map (clk=>clk27,clr=>clr,I_pc=>i_pc_aux,O_pc=>o_pc_aux);
SP : stack_pointer port map (clk=>clk27,clr=>clr,I_sp=>i_sp_aux,O_sp=>o_sp_aux);
RAMtop : RAM port map (clk=>clk27,clr=>clr,WE=>s0,A=>o_sp_ret_aux,WD=>norm_pc_aux,RD=>rd_aux); 	
	
leds<=o_pc_aux;	
	
end Behavioral;
