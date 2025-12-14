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

     O<=x"E010" when A=x"0000" else -- 10 e0
       x"E058" when A=x"0001" else -- 58 e0
       x"E467" when A=x"0002" else -- 67 e4
       x"E076" when A=x"0003" else -- 76 e0
       x"E781" when A=x"0004" else -- 81 e7
       x"E098" when A=x"0005" else -- 98 e0
       x"E2AB" when A=x"0006" else -- ab e2
       x"E2B1" when A=x"0007" else -- b1 e2
       x"E2C8" when A=x"0008" else -- c8 e2
       x"D00A" when A=x"0009" else -- 0a d0
       x"D00D" when A=x"000A" else -- 0d d0
       x"D010" when A=x"000B" else -- 10 d0
       x"D013" when A=x"000C" else -- 13 d0
       x"D016" when A=x"000D" else -- 16 d0
       x"D019" when A=x"000E" else -- 19 d0
       x"D01C" when A=x"000F" else -- 1c d0
       x"D01F" when A=x"0010" else -- 1f d0
       x"D022" when A=x"0011" else -- 22 d0
       x"D02A" when A=x"0012" else -- 2a d0
       x"CFF5" when A=x"0013" else -- f5 cf
       x"E70F" when A=x"0014" else -- 0f e7
       x"B90B" when A=x"0015" else -- 0b b9
       x"B955" when A=x"0016" else -- 55 b9
       x"9508" when A=x"0017" else -- 08 95
       x"EB0F" when A=x"0018" else -- 0f eb
       x"B90B" when A=x"0019" else -- 0b b9
       x"B965" when A=x"001A" else -- 65 b9
       x"9508" when A=x"001B" else -- 08 95
       x"ED0F" when A=x"001C" else -- 0f ed
       x"B90B" when A=x"001D" else -- 0b b9
       x"B975" when A=x"001E" else -- 75 b9
       x"9508" when A=x"001F" else -- 08 95
       x"EE0F" when A=x"0020" else -- 0f ee
       x"B90B" when A=x"0021" else -- 0b b9
       x"B985" when A=x"0022" else -- 85 b9
       x"9508" when A=x"0023" else -- 08 95
       x"EF07" when A=x"0024" else -- 07 ef
       x"B90B" when A=x"0025" else -- 0b b9
       x"B995" when A=x"0026" else -- 95 b9
       x"9508" when A=x"0027" else -- 08 95
       x"EF0B" when A=x"0028" else -- 0b ef
       x"B90B" when A=x"0029" else -- 0b b9
       x"B9A5" when A=x"002A" else -- a5 b9
       x"9508" when A=x"002B" else -- 08 95
       x"EF0D" when A=x"002C" else -- 0d ef
       x"B90B" when A=x"002D" else -- 0b b9
       x"B9B5" when A=x"002E" else -- b5 b9
       x"9508" when A=x"002F" else -- 08 95
       x"EF0E" when A=x"0030" else -- 0e ef
       x"B90B" when A=x"0031" else -- 0b b9
       x"B9C5" when A=x"0032" else -- c5 b9
       x"9508" when A=x"0033" else -- 08 95
       x"2F56" when A=x"0034" else -- 56 2f
       x"2F67" when A=x"0035" else -- 67 2f
       x"2F78" when A=x"0036" else -- 78 2f
       x"2F89" when A=x"0037" else -- 89 2f
       x"2F9A" when A=x"0038" else -- 9a 2f
       x"2FAB" when A=x"0039" else -- ab 2f
       x"2FBC" when A=x"003A" else -- bc 2f
       x"9513" when A=x"003B" else -- 13 95
       x"9508" when A=x"003C" else -- 08 95
       x"3114" when A=x"003D" else -- 14 31
       x"F131" when A=x"003E" else -- 31 f1
       x"3011" when A=x"003F" else -- 11 30
       x"F1A9" when A=x"0040" else -- a9 f1
       x"3012" when A=x"0041" else -- 12 30
       x"F1A9" when A=x"0042" else -- a9 f1
       x"3013" when A=x"0043" else -- 13 30
       x"F1A9" when A=x"0044" else -- a9 f1
       x"3014" when A=x"0045" else -- 14 30
       x"F179" when A=x"0046" else -- 79 f1
       x"3015" when A=x"0047" else -- 15 30
       x"F109" when A=x"0048" else -- 09 f1
       x"3016" when A=x"0049" else -- 16 30
       x"F189" when A=x"004A" else -- 89 f1
       x"3017" when A=x"004B" else -- 17 30
       x"F119" when A=x"004C" else -- 19 f1
       x"3018" when A=x"004D" else -- 18 30
       x"F179" when A=x"004E" else -- 79 f1
       x"3019" when A=x"004F" else -- 19 30
       x"F0B9" when A=x"0050" else -- b9 f0
       x"301A" when A=x"0051" else -- 1a 30
       x"F129" when A=x"0052" else -- 29 f1
       x"301B" when A=x"0053" else -- 1b 30
       x"F119" when A=x"0054" else -- 19 f1
       x"301C" when A=x"0055" else -- 1c 30
       x"F089" when A=x"0056" else -- 89 f0
       x"301D" when A=x"0057" else -- 1d 30
       x"F089" when A=x"0058" else -- 89 f0
       x"301E" when A=x"0059" else -- 1e 30
       x"F089" when A=x"005A" else -- 89 f0
       x"301F" when A=x"005B" else -- 1f 30
       x"F089" when A=x"005C" else -- 89 f0
       x"3110" when A=x"005D" else -- 10 31
       x"F049" when A=x"005E" else -- 49 f0
       x"3111" when A=x"005F" else -- 11 31
       x"F079" when A=x"0060" else -- 79 f0
       x"3112" when A=x"0061" else -- 12 31
       x"F079" when A=x"0062" else -- 79 f0
       x"3113" when A=x"0063" else -- 13 31
       x"F079" when A=x"0064" else -- 79 f0
       x"E010" when A=x"0065" else -- 10 e0
       x"E0C8" when A=x"0066" else -- c8 e0
       x"9508" when A=x"0067" else -- 08 95
       x"E0C8" when A=x"0068" else -- c8 e0
       x"9508" when A=x"0069" else -- 08 95
       x"E4C7" when A=x"006A" else -- c7 e4
       x"9508" when A=x"006B" else -- 08 95
       x"E0C6" when A=x"006C" else -- c6 e0
       x"9508" when A=x"006D" else -- 08 95
       x"E7C1" when A=x"006E" else -- c1 e7
       x"9508" when A=x"006F" else -- 08 95
       x"E2CB" when A=x"0070" else -- cb e2
       x"9508" when A=x"0071" else -- 08 95
       x"E2C1" when A=x"0072" else -- c1 e2
       x"9508" when A=x"0073" else -- 08 95
       x"E2C8" when A=x"0074" else -- c8 e2
       x"9508" when A=x"0075" else -- 08 95
       x"E0C1" when A=x"0076" else -- c1 e0
       x"9508" when A=x"0077" else -- 08 95
       x"EFCF" when A=x"0078" else -- cf ef
       x"9508" when A=x"0079" else -- 08 95
       x"E4C6" when A=x"007A" else -- c6 e4
       x"9508" when A=x"007B" else -- 08 95
       x"E4C1" when A=x"007C" else -- c1 e4
       x"9508" when A=x"007D" else -- 08 95
       x"E2C2" when A=x"007E" else -- c2 e2
       x"9508" when A=x"007F" else -- 08 95
       x"FFFF"; 
end Behavioral;

