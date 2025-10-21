----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:34 10/20/2025 
-- Design Name: 
-- Module Name:    cont_32 - Behavioral 
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

entity cont_32 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sal : out  STD_LOGIC_VECTOR(4 downto 0));
end cont_32;

architecture Behavioral of cont_32 is

signal contador_int : STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin
    process(clk, clr)
    begin
        if clr = '1' then
            contador_int<=(others => '0');
        elsif (clk'event and clk='1') then
            contador_int<=contador_int + 1;
        end if;
    end process;
    
    sal<=contador_int;
end Behavioral;
