----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:27 10/20/2025 
-- Design Name: 
-- Module Name:    div_18 - Behavioral 
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

entity div_18 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           q : out  STD_LOGIC);
end div_18;

architecture Behavioral of div_18 is
	signal q_aux: STD_LOGIC_VECTOR(18 downto 0);
begin
	process(clk,clr)
		begin
		if(clr='1')then q_aux <= (others => '0');
		elsif(clk'event and clk='1')then
			q_aux <= q_aux+1;
		end if;
	end process;
	q <= q_aux(18);
end Behavioral;
