----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:23 12/01/2016 
-- Design Name: 
-- Module Name:    Contador - Behavioral 
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


entity Contador is
port (
   clk: in std_logic;
   set_contador: in std_logic :='0';
	set_contador2: in std_logic :='0';
	flag_contou: out std_logic :='0';
	flag_contou2: out std_logic :='0';
	timer: in integer
);
end Contador;

architecture Behavioral of Contador is
begin 
process(clk)
variable cont, cont1: integer:=0;
begin
				if (set_contador ='1') then
						if (cont < timer) then 
								cont := cont+1;
						else 
							cont := 0;
							flag_contou <= '1';
						end if;
				else
					cont := 0;
					flag_contou <= '0';
				end if;
				
				
				if (set_contador2 ='1') then
						if (cont1 < timer) then 
								cont1 := cont1+1;
						else 
							cont1 := 0;
							flag_contou2 <= '1';
						end if;
				else
					cont1 := 0;
					flag_contou2 <= '1';
				end if;

		
end process;
end Behavioral;

