----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:31 10/13/2025 
-- Design Name: 
-- Module Name:    dec_instr - Behavioral 
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

entity dec_instr is
    Port ( I : in  STD_LOGIC_VECTOR (15 downto 0);
           sel_read_d : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_read_r : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_w_d : out  STD_LOGIC_VECTOR (4 downto 0);
           sel_alu : out  STD_LOGIC_VECTOR (3 downto 0);
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
end dec_instr;

architecture Behavioral of dec_instr is

begin

	process(I)
	begin
		case I(15 downto 12) is
			
			when "0000" => --add, lsl, nop
							if(I(11 downto 10)="00") then --nop
							
								sel_read_d <="00000";
								sel_read_r <="00000";
								sel_w_d <="00000";
								sel_alu <="0000";
								l_d <='0';
								ld_mov <='0';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
								
							elsif(I(8 downto 4)=(I(9)&I(3 downto 0))) then --lsl
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <="00000";
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0110";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
							
							else --add
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0000";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';							
								
							end if;
							
				when "0001" => --resta, cp*(comparar)
								
							if(I(11 downto 0)="10") then --sub(resta)
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0001";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
							else 
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0001";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
							end if;
					
				when "0010" => --and, or, eor, mov
				
							if(I(11 downto 10)="00") then --and
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0001";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
								
							elsif(I(11 downto 10)="10") then --or

								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0011";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	
								
								
							elsif(I(11 downto 10)="10") then --xor

								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0100";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';

							else --mov

								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0001";
								l_d <='1';
								ld_mov <='0';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	
								
							end if;
				when "1001" => --com, lsr, inc, dec, ret
							
							if(I(3 downto 0)="0000") then --com
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0101";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	
								
							elsif(I(3 downto 0)="0110") then --lsr
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';

							elsif(I(3 downto 0)="0011") then --inc
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "1000";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	
								
							elsif(I(3 downto 0)="1010") then --dec
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "1001";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='1';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
								
							else --ret
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0001";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='1';
								s1 <='1';
								s0 <='0';								
							
							end if;
					
					
				when "1110" => --ldi
					
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= ('1'&I(7 downto 4));
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='0';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='1';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
				when "1111" => --breq, bme
				
							if(I(11 downto 10)="00") then --breq
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='1';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	
								
							else --bme
							
								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='1';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
								
							end if;
							

				when "1100" => --rjmp

								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='1';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';	

				when "1101" => --rcall	

								sel_read_d <= I(8 downto 4);
								sel_read_r <= (I(9)&I(3 downto 0));
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='1';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='0';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='1';					

				when others => --out
				
								sel_read_d <= I(8 downto 4);
								sel_read_r <= I(8 downto 4);
								sel_w_d <= I(8 downto 4);
								sel_alu <= "0111";
								l_d <='0';
								ld_mov <='1';
								sel_rel <='0';
								br <='0';
								bn <='0';
								en_w <='0';
								en_port <='1';
								en_sreg <='0';
								ret_sub <='0';
								s1 <='0';
								s0 <='0';
		end case;
	end process;
end Behavioral;

