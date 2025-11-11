----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:30 10/09/2025 
-- Design Name: 
-- Module Name:    program_c - Behavioral 
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

entity program_c is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_pc : in  STD_LOGIC_VECTOR (15 downto 0);
           O_pc : out  STD_LOGIC_VECTOR (15 downto 0));
end program_c;

architecture Behavioral of program_c is

signal q_aux : STD_LOGIC_VECTOR (15 downto 0);
signal primer_ciclo : STD_LOGIC := '1';

begin

	process(clk, clr)
	begin
	
		if(clr='1') then 
			q_aux<= (others =>'0');
			primer_ciclo <= '1';
		elsif(clk'event and clk='1') then 
			if(primer_ciclo='1') then
				q_aux <= x"0000";
				primer_ciclo <= '0';
			else
				q_aux<=I_pc;
			end if;
		end if;

	end process;

	O_pc<= q_aux;
end Behavioral;
