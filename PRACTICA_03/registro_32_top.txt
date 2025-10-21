----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:39 10/20/2025 
-- Design Name: 
-- Module Name:    registro_32_top - Behavioral 
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

entity registro_32_top is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           clr0 : in  STD_LOGIC;
           clr1 : in  STD_LOGIC;
           clr2 : in  STD_LOGIC;
           en_w : in  STD_LOGIC;
           dato_I : in  STD_LOGIC_VECTOR (7 downto 0);
           O_r : out  STD_LOGIC_VECTOR (7 downto 0);
           O_d : out  STD_LOGIC_VECTOR (7 downto 0));
end registro_32_top;

architecture Behavioral of registro_32_top is

signal clk_aux,clk_wd,clk_rd,clk_rr : STD_LOGIC;
signal sel_wd_aux,sel_rd_aux,sel_rr_aux : STD_LOGIC_VECTOR(4 downto 0);

component div_18 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component eliminador_r is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           ent : in  STD_LOGIC;
           sal : out  STD_LOGIC);
end component;

component cont_32 is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           sal : out  STD_LOGIC_VECTOR(4 downto 0));
end component;

component archivo_registros is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en_w : in  STD_LOGIC;
           sel_w_d : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_r_r : in  STD_LOGIC_VECTOR (4 downto 0);
           sel_r_d : in  STD_LOGIC_VECTOR (4 downto 0);
           dato_I : in  STD_LOGIC_VECTOR (7 downto 0);
           O_r : out  STD_LOGIC_VECTOR (7 downto 0);
           O_d : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin

clk_div: div_18 port map (clk=>clk,clr=>clr,q=>clk_aux);

eliminador_wd : eliminador_r port map (clk=>clk_aux,clr=>clr,ent=>btn0,sal=>clk_wd);
eliminador_rd : eliminador_r port map (clk=>clk_aux,clr=>clr,ent=>btn1,sal=>clk_rd);
eliminador_rr : eliminador_r port map (clk=>clk_aux,clr=>clr,ent=>btn2,sal=>clk_rr);

cont_wd : cont_32 port map (clk=>clk_wd,clr=>clr0,sal=>sel_wd_aux);
cont_rd : cont_32 port map (clk=>clk_rd,clr=>clr1,sal=>sel_rd_aux);
cont_rr : cont_32 port map (clk=>clk_rr,clr=>clr2,sal=>sel_rr_aux);

archivo : archivo_registros port map (clk=>clk_aux,clr=>clr,en_w=>en_w,sel_w_d=>sel_wd_aux,sel_r_r=>sel_rr_aux,sel_r_d=>sel_rd_aux,dato_I=>dato_I,O_r=>O_r,O_d=>O_d);

end Behavioral;