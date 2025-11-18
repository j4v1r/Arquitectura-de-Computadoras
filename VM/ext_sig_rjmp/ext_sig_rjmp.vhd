----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:31 11/18/2025 
-- Design Name: 
-- Module Name:    ext_sig_rjmp - Behavioral 
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

entity ext_sig_rjmp is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end ext_sig_rjmp;

architecture Behavioral of ext_sig_rjmp is

begin

	O(11 downto 0)<=I(11 downto 0);
	O(12)<=I(11);
	O(13)<=I(11);
	O(14)<=I(11);
	O(15)<=I(11);

end Behavioral;

