----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:39 10/30/2025 
-- Design Name: 
-- Module Name:    procesador - Behavioral 
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

entity procesador is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           portb : out  STD_LOGIC_VECTOR (7 downto 0));
end procesador;

architecture Behavioral of procesador is

component dec_instr is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           sel_read_d : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_r : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_w_d : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_alu : out  STD_LOGIC_VECTOR (2 downto 0);
           l_d : out  STD_LOGIC;
			  ld_mov : out  STD_LOGIC;
           sel_rel : out  STD_LOGIC;
           br : out  STD_LOGIC;
           bn : out  STD_LOGIC;
           en_w : out  STD_LOGIC;
           en_port : out  STD_LOGIC;
           en_sreg : out  STD_LOGIC;
           ret_sub : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC);
end component;

--ext_sig_br
--ext_sig_rjmp

component program_c is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_pc : in  STD_LOGIC_VECTOR (15 downto 0);
           O_pc : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component ROM is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
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

component Registro_ALU is --port B
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en  : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ALU is
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           --C : out  STD_LOGIC;
			  --N : out STD_LOGIC;
           Z : out  STD_LOGIC);
end component;

component S_Reg is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           en : in  STD_LOGIC;
           ent_sreg : in  STD_LOGIC;
           sal_sreg : out  STD_LOGIC);
end component;

component Stack_Pointer is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           I_sp : in  STD_LOGIC_VECTOR (3 downto 0);
           O_sp : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component RAM is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;  --supuestamente sin clr
			  WE : in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           WD : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0));
end component;


signal PC_aux, I_aux, br_mux_aux,offset_aux,I_PC_aux,off_br_aux,off_rjmp_aux,rd_aux,wd_aux : STD_LOGIC_VECTOR(15 downto 0);
signal O_r_aux, O_d_aux, dato_I_aux, F_aux : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal sel_read_d_aux,sel_read_r_aux,sel_w_d_aux : STD_LOGIC_VECTOR(4 downto 0);
signal A_aux,i_sp_aux,o_sp_aux,call_aux,ret_aux : STD_LOGIC_VECTOR(3 downto 0);
signal sel_alu_aux : STD_LOGIC_VECTOR(2 downto 0);
signal ld_aux,sel_rel_aux,br_aux,bn_aux,en_w_aux,en_port_aux,en_sreg_aux,ld_mov_aux,ret_s_aux,s1_aux,s0_aux,branch_aux,ent_sreg_aux,sal_sreg_aux: STD_LOGIC;

begin

	--Multiplexores
	offset_aux<=x"0001" when sel_rel_aux='0' and branch_aux='0' else
					off_br_aux + 1 when sel_rel_aux='0' AND branch_aux='1' else
					off_rjmp_aux + 1; 

	branch_aux<=bn_aux when sal_sreg_aux='0' else --s_sreg_aux
					br_aux;
	
	br_mux_aux<=I_PC_aux when ret_s_aux='0' else
					rd_aux;

	dato_I_aux<=(I_aux(11 downto 8) & I_aux(3 downto 0)) when ld_mov_aux='0' AND ld_aux='0' else
					O_r_aux when ld_mov_aux='0' AND ld_aux='1' else
					F_aux;

	i_sp_aux<=o_sp_aux when s1_aux='0' and s0_aux='0' else
				 call_aux when s1_aux='0' and s0_aux='1' else
				 ret_aux;

	A_aux<=o_sp_aux when s1_aux='0' else
			 ret_aux;

	--Sumadores
	I_PC_aux <= offset_aux +PC_aux;
	wd_aux <= PC_aux + x"0001";
	call_aux <= o_sp_aux - "0010";
	ret_aux<=o_sp_aux + "0010";

cto1 : dec_instr port map( I=>I_aux,
           sel_read_d=>sel_read_d_aux,
           sel_read_r=>sel_read_r_aux,
           sel_w_d=>sel_w_d_aux,
           sel_alu=>sel_alu_aux,
           l_d=>ld_aux,
			  ld_mov=>ld_mov_aux,
           sel_rel=>sel_rel_aux,
           br=>br_aux,
           bn=>bn_aux,
           en_w=>en_w_aux,
           en_port=>en_port_aux,
           en_sreg=>en_sreg_aux,
           ret_sub=>ret_s_aux,
           s1=>s1_aux,
           s0=>s0_aux);
			  
cto4 : program_c port map( clk=>clk,
           clr=>clr,
           I_pc=>br_mux_aux,
           O_pc=>PC_aux);  

cto5 : ROM port map( A=>PC_aux,
			  O=>I_aux);
			  
cto6 : archivo_registros port map( clk=>clk,
           clr=>clr,
           en_w=>en_w_aux,
           sel_w_d=>sel_w_d_aux,
           sel_r_r=>sel_read_r_aux,
           sel_r_d=>sel_read_d_aux,
           dato_I=>dato_I_aux,
           O_r=>O_r_aux,
           O_d=>O_d_aux);

cto7 : Registro_ALU port map( clk=>clk,   --port B
           clr=>clr,
           en=>en_port_aux, 
           I=>O_r_aux,
           Q=>portb);
			  
cto8 : ALU port map( sel=>sel_alu_aux,
           A=>O_d_aux,
           B=>O_r_aux,
           F=>F_Aux,
           --C : out  STD_LOGIC;
			  --N : out STD_LOGIC;
           Z=>ent_sreg_aux);
			  
cto9 : S_Reg port map( clk=>clk,
           clr=>clr,
           en=>en_sreg_aux,
           ent_sreg=>ent_sreg_aux,
           sal_sreg=>sal_sreg_aux);  

cto10 : Stack_Pointer port map( clk=>clk,
           clr=>clr,
           I_sp=>i_sp_aux,
           O_sp=>o_sp_aux);

cto11 : RAM port map( clk=>clk,
           clr=>clr,
			  WE=>s0_aux,
           A=>A_aux,
           WD=>wd_aux,
           RD=>rd_aux);

end Behavioral;

