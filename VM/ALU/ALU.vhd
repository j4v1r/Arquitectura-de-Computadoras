----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:40 11/18/2025 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           N : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal F_aux :std_logic_vector(8 downto 0);
	
begin
	
	process(sel,A,B)
		begin
		case sel is
		when "0000"=> F_aux<=('0'&A) + ('0'&B);
		when "0001"=> F_aux<=('0'&A) - ('0'&B);
		when "0010"=> F_aux<=('0'&A) and ('0'&B);
		when "0011"=> F_aux<=('0'&A) or ('0'&B);
		when "0100"=> F_aux<=('0'&A) xor ('0'&B);
		when "0101"=> F_aux<= not ('0'&A);
		when "0110"=> F_aux(7 downto 1)<=A(6 downto 0);F_aux(0)<='0';F_aux(8)<=A(7);
		when "1000"=> F_aux<=('0'&A) + 1;
		when "1001"=> F_aux<=('0'&A) - 1;
		when others=> F_aux(6 downto 0)<=A(7 downto 1);F_aux(7)<='0';F_aux(8)<=A(0);
		end case;
	end process;
	
	F<=F_aux(7 downto 0);
	C<=F_aux(8);
	Z<=not(F_aux(7) or F_aux(6) or F_aux(5) or F_aux(4) or F_aux(3) or F_aux(2) or F_aux(1) or F_aux(0));
	N<=F_aux(7);

end Behavioral;