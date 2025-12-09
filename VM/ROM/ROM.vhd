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

    O<=x"0000" when A=x"0000" else -- 00 00
       x"0000" when A=x"0001" else -- 00 00
       x"E000" when A=x"0002" else -- 00 e0
       x"E011" when A=x"0003" else -- 11 e0
       x"E022" when A=x"0004" else -- 22 e0
       x"E033" when A=x"0005" else -- 33 e0
       x"E044" when A=x"0006" else -- 44 e0
       x"E055" when A=x"0007" else -- 55 e0
       x"E066" when A=x"0008" else -- 66 e0
       x"E077" when A=x"0009" else -- 77 e0
       x"E088" when A=x"000A" else -- 88 e0
       x"E099" when A=x"000B" else -- 99 e0
       x"E0AA" when A=x"000C" else -- aa e0
       x"E0B0" when A=x"000D" else -- b0 e0
       x"D003" when A=x"000E" else -- 03 d0
       x"D034" when A=x"000F" else -- 34 d0
       x"D038" when A=x"0010" else -- 38 d0
       x"CFFC" when A=x"0011" else -- fc cf
       x"17B0" when A=x"0012" else -- b0 17
       x"F091" when A=x"0013" else -- 91 f0
       x"17B1" when A=x"0014" else -- b1 17
       x"F099" when A=x"0015" else -- 99 f0
       x"17B2" when A=x"0016" else -- b2 17
       x"F0A1" when A=x"0017" else -- a1 f0
       x"17B3" when A=x"0018" else -- b3 17
       x"F0A9" when A=x"0019" else -- a9 f0
       x"17B4" when A=x"001A" else -- b4 17
       x"F0B1" when A=x"001B" else -- b1 f0
       x"17B5" when A=x"001C" else -- b5 17
       x"F0B9" when A=x"001D" else -- b9 f0
       x"17B6" when A=x"001E" else -- b6 17
       x"F0C1" when A=x"001F" else -- c1 f0
       x"17B7" when A=x"0020" else -- b7 17
       x"F0C9" when A=x"0021" else -- c9 f0
       x"17B8" when A=x"0022" else -- b8 17
       x"F0D1" when A=x"0023" else -- d1 f0
       x"17B9" when A=x"0024" else -- b9 17
       x"F0D9" when A=x"0025" else -- d9 f0
       x"E0C1" when A=x"0026" else -- c1 e0
       x"B9C5" when A=x"0027" else -- c5 b9
       x"9508" when A=x"0028" else -- 08 95
       x"E4CF" when A=x"0029" else -- cf e4
       x"B9C5" when A=x"002A" else -- c5 b9
       x"9508" when A=x"002B" else -- 08 95
       x"E1C2" when A=x"002C" else -- c2 e1
       x"B9C5" when A=x"002D" else -- c5 b9
       x"9508" when A=x"002E" else -- 08 95
       x"E0C6" when A=x"002F" else -- c6 e0
       x"B9C5" when A=x"0030" else -- c5 b9
       x"9508" when A=x"0031" else -- 08 95
       x"E4CC" when A=x"0032" else -- cc e4
       x"B9C5" when A=x"0033" else -- c5 b9
       x"9508" when A=x"0034" else -- 08 95
       x"E2C4" when A=x"0035" else -- c4 e2
       x"B9C5" when A=x"0036" else -- c5 b9
       x"9508" when A=x"0037" else -- 08 95
       x"E2C0" when A=x"0038" else -- c0 e2
       x"B9C5" when A=x"0039" else -- c5 b9
       x"9508" when A=x"003A" else -- 08 95
       x"E0CF" when A=x"003B" else -- cf e0
       x"B9C5" when A=x"003C" else -- c5 b9
       x"9508" when A=x"003D" else -- 08 95
       x"E0C0" when A=x"003E" else -- c0 e0
       x"B9C5" when A=x"003F" else -- c5 b9
       x"9508" when A=x"0040" else -- 08 95
       x"E0C4" when A=x"0041" else -- c4 e0
       x"B9C5" when A=x"0042" else -- c5 b9
       x"9508" when A=x"0043" else -- 08 95
       x"95B3" when A=x"0044" else -- b3 95
       x"17BA" when A=x"0045" else -- ba 17
       x"F409" when A=x"0046" else -- 09 f4
       x"E0B0" when A=x"0047" else -- b0 e0
       x"9508" when A=x"0048" else -- 08 95
       x"ECD8" when A=x"0049" else -- d8 ec
       x"ECE8" when A=x"004A" else -- e8 ec
       x"ECF8" when A=x"004B" else -- f8 ec
       x"0000" when A=x"004C" else -- 00 00
       x"0000" when A=x"004D" else -- 00 00
       x"0000" when A=x"004E" else -- 00 00
       x"0000" when A=x"004F" else -- 00 00
       x"0000" when A=x"0050" else -- 00 00
       x"0000" when A=x"0051" else -- 00 00
       x"0000" when A=x"0052" else -- 00 00
       x"0000" when A=x"0053" else -- 00 00
       x"0000" when A=x"0054" else -- 00 00
       x"0000" when A=x"0055" else -- 00 00
       x"95FA" when A=x"0056" else -- fa 95
       x"F7A1" when A=x"0057" else -- a1 f7
       x"95EA" when A=x"0058" else -- ea 95
       x"F789" when A=x"0059" else -- 89 f7
       x"95DA" when A=x"005A" else -- da 95
       x"F771" when A=x"005B" else -- 71 f7
       x"9508" when A=x"005C" else -- 08 95
       x"FFFF";	
		 
end Behavioral;

