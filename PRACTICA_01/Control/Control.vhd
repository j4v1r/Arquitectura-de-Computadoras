----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:51 09/30/2025 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity control is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           inicio : in  STD_LOGIC;
           s : out  STD_LOGIC;
           sd : out  STD_LOGIC_VECTOR (1 downto 0);
			  se : out  STD_LOGIC_VECTOR (1 downto 0);
           sr : out  STD_LOGIC_VECTOR (1 downto 0));
end control;

architecture Behavioral of control is

type estados is(espera,carga,suma,final);

signal edo_pres, edo_sig: estados; 

begin

process(inicio,edo_pres)
	begin
	case edo_pres is 
		when espera=>sd<="00"; sr<="11"; se<="11"; s<='0';
			if (inicio = '1') then 
				edo_sig <= carga;
			else 
				edo_sig <= espera;
			end if;
		when carga=> sd<= "00"; sr<="00"; se<="00"; s<='0';edo_sig<=suma;
			
		when suma=>sd<= "00"; sr<="11"; se<="00"; s<='1';edo_sig<=final;
		
		when others=>sd<= "11"; sr<="11"; se<="11"; s<='0';edo_sig<=final;
	
	end case;
end process;

process(clk, clr)
	begin 
	
		if(clr='1')then edo_pres<=espera;
		elsif(clk'event and clk='1')then
				edo_pres<=edo_sig;
		end if;
end process;


end Behavioral;

