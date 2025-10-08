----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:38 09/30/2025 
-- Design Name: 
-- Module Name:    Registro - Behavioral 
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

entity Registro is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           s1s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           I : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Registro;

architecture Behavioral of Registro is
signal q_aux : std_logic_vector(3 downto 0);
begin

	process(clk,clr)
		begin
		if(clr='1')then q_aux<="0000";
		elsif(clk'event and clk='1') then
				case s1s0 is
					when "00" => q_aux <=I;
					when "01" => q_aux <= '0' & q_aux(3 downto 1);
					when "10" => q_aux <= q_aux(2 downto 0) & '0';
					when others => q_aux <= q_aux;
				end case;
		end if;
	end process;
	Q <= q_aux;


end Behavioral;

