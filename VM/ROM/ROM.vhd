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

	O<=x"ef0f" when A=x"0000" else --ef05 --e005  --ef0f  --e005 --0000
		x"0f00" when A=x"0001" else --b905 --e013  --e011  --     --0000
		x"e001" when A=x"0002" else --e0e3 --0f01  --0f01  --     --e021
		x"e011" when A=x"0003" else --b9e5 --b905  --f019  --     --e001
		--x"0000" when A=x"0004" else  ----------- --b905	--     --e810
		--x"0000" when A=x"0005" else  ----------- --0000	--     --b905
		--x"d010" when A=x"0006" else					 --0000	--     --d010
		--x"0f00" when A=x"0007" else					 --ef0a	--     --0f00
		--x"b905" when A=x"0008" else					 --b905	--     --b905
		--x"d00d" when A=x"0009" else					 --0000	--     --d00d
		--x"1b01" when A=x"000a" else					 --0000	--		 --1b01
		--x"f011" when A=x"000b" else		 								 --f011
		--x"0f01" when A=x"000c" else										 --0f01
		--x"cff9" when A=x"000d" else										 --cff9
		--x"e800" when A=x"000e" else										 --e800
		--x"e011" when A=x"000f" else										 --e011
		--x"9506" when A=x"0010" else										 --9506
		--x"b905" when A=x"0011" else										 --b905
		--x"d004" when A=x"0012" else										 --d004
		--x"1b01" when A=x"0013" else										 --1b01
		--x"f371" when A=x"0014" else  									 --f371
		--x"0f01" when A=x"0015" else										 --0f01
		--x"cff9" when A=x"0016" else										 --cff9
		--x"e13f" when A=x"0017" else										 --e13f
		--x"ec48" when A=x"0018" else										 --ec48
		--x"ec58" when A=x"0019" else										 --ec58
		--x"0000" when A=x"001a" else										 --0000
		--x"0000" when A=x"001b" else										 --0000
		--x"0000" when A=x"001c" else										 --0000
		--x"0000" when A=x"001d" else										 --0000
		--x"0000" when A=x"001e" else										 --0000
		--x"0000" when A=x"001f" else										 --0000
		--x"0000" when A=x"0020" else										 --0000
		--x"0000" when A=x"0021" else										 --0000
		--x"1b52" when A=x"001a" else										 --1b52
		--x"f7b1" when A=x"001a" else										 --f7b1
		--x"1b42" when A=x"001a" else										 --1b42
		--x"f799" when A=x"001a" else										 --f799
		--x"1b32" when A=x"001a" else								    	 --1b32
		--x"f781" when A=x"001a" else										 --f781
		--x"9508" when A=x"001a" else										 --9508
		x"ffff";	
end Behavioral;

