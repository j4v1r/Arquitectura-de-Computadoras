----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:15 09/29/2025 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  WE : in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0));
end RAM;

architecture Behavioral of RAM is

type ram is array(15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal dato : ram := (others => (others => '0'));

begin

	process(clk,clr,WE)
	begin
		if(clr='1') then
			dato <= (others => (others => '0'));
		elsif(clk'event and clk='1' and WE='1')then
			dato(conv_integer(A))<=WD;
		end if;
	end process;

	RD<=dato(conv_integer(A));

end Behavioral;
