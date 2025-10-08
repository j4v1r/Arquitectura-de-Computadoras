----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:32 10/06/2025 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  s : in STD_LOGIC;
           sd : in  STD_LOGIC_VECTOR (1 downto 0);
           sr : in  STD_LOGIC_VECTOR (1 downto 0);
			  se : in STD_LOGIC_VECTOR (1 downto 0);
			  sel : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           R : in  STD_LOGIC_VECTOR (7 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC;
			  N : out STD_LOGIC;
           Z : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component Registro_ALU is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           s1s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           I : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Z_aux, N_aux, C_aux : STD_LOGIC;
signal mux_aux, mux_aux_e, d_aux,r_aux, e_aux: std_logic_vector(7 downto 0);
signal F_aux : std_logic_vector(8 downto 0);
begin

	mux_aux <= D when s='0' else F_aux(7 downto 0);

	process(D,R,sel)
		begin
		case sel is
		when "000" => F_aux <= ('0'&D) + ('0'&R);
		when "001" => F_aux <= ('0'&D) - ('0'&R);
		when "010" => F_aux <= ('0'&D) and ('0'&R);
		when "011" => F_aux <= ('0'&D) or ('0'&R);
		when "100" => F_aux <= ('0'&D) xor ('0'&R);
		when "101" => F_aux <= not ('0'&D);
		when "110" => F_aux(7 downto 1) <= D(6 downto 0);F_aux(0)<='0';F_aux(8)<=D(7);
		when others => F_aux(6 downto 0) <= D(7 downto 1);F_aux(7)<='0';F_aux(8)<=D(0);
		end case;
	end process;

	Z_aux<=not(F_aux(7) or F_aux(6) or F_aux(5) or F_aux(4) or F_aux(3) or F_aux(2) or F_aux(1) or F_aux(0));
	N_aux<=F_aux(7);
	C_aux<=F_aux(8);
	
	mux_aux_e<= "00000000" when s='0' else ('0' & '0' & '0' & '0' & '0' & Z_aux & N_aux & C_aux);


fuente: Registro_ALU port map(clk=>clk,clr=>clr,s1s0=>sr,I=>R,Q=>r_aux);
destino: Registro_ALU port map(clk=>clk,clr=>clr,s1s0=>sd,I=>mux_aux,Q=>d_aux);
estado: Registro_ALU port map(clk=>clk,clr=>clr,s1s0=>se,I=>mux_aux_e,Q=>e_aux);

	Z<=e_aux(2);
	N<=e_aux(1);
	C<=e_aux(0);
	F<=d_aux;

end Behavioral;


