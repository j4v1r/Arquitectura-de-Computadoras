----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:28 10/09/2025 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end ROM;

architecture Behavioral of ROM is

begin

	O<=x"ef0f" when A=x"0000" else --ef05 --e005  --ef0f  --e005
		x"0f00" when A=x"0001" else --b905 --e013  --e011  --
		x"e001" when A=x"0002" else --e0e3 --0f01  --0f01  --
		x"e011" when A=x"0003" else --b9e5 --b905  --f019  --
		--x"0000" x"0004"      ------------------- --b905	--
		--x"0000" x"0005"      ------------------- --0000	--
																 --0000	--
																 --ef0a	--
																 --b905	--
																 --0000	--
																 --0000	--
		x"ffff";

end Behavioral;

