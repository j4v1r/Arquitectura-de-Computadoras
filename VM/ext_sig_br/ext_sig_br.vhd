----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:36 11/11/2025 
-- Design Name: 
-- Module Name:    ext_sig_br - Behavioral 
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

entity ext_sig_br is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end ext_sig_br;

architecture Behavioral of ext_sig_br is

begin

	O(6 downto 0)<=I(9 downto 3);
	O(7)<=I(9);
	O(8)<=I(9);
	O(9)<=I(9);
	O(10)<=I(9);
	O(11)<=I(9);
	O(12)<=I(9);
	O(13)<=I(9);
	O(14)<=I(9);
	O(15)<=I(9);

end Behavioral;

