-----------------------------------------Declaração das bibliotecas----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------

entity Decoder1 is
 port ( 
		caracter: in character; 
		fase: in integer range 0 to 100;
		seven_seg_caracter: out std_logic_vector (6 downto 0);
		seven_seg_numero: out std_logic_vector(6 downto 0); 
		seven_seg_scoreDez: out std_logic_vector(6 downto 0);
		LEDS: out std_logic_vector (3 downto 0)
--		acendeled: in integer range 0 to 4
 );
end Decoder1;

architecture Behavioral of Decoder1 is

begin
	WITH caracter SELECT --Decoder para escrever mensagem de inicio e fim
			seven_seg_caracter <=   "0011000" WHEN 'P', 
											"1111010" WHEN 'R', 
											"1100010" WHEN 'O', 
											"1000011" WHEN 'J', 
											"0110000" WHEN 'E', 
											"1111000" WHEN 'T', 
											"0001000" WHEN 'A', 
											"1110001" WHEN 'L', 
											"1111001" WHEN 'I', 
											"1110010" WHEN 'C', 
											"1000001" WHEN 'V', 
											"0100000" WHEN 'G', 
											"0111000" WHEN 'F',
         								"1111111" WHEN ' ',
											"1000010" WHEN 'D',
											"0000110" WHEN 'M',
											"1111111" WHEN OTHERS; -- Espaço vazio quando sem mensagens

	WITH fase SELECT --Utiliza o comando SELECT em função da entrada cont.
			seven_seg_numero <=     "0000001" WHEN 0, --Escreve 0 para o display
											"1001111" WHEN 1, --Escreve 1 para o display
											"0010010" WHEN 2, --Escreve 2 para o display
											"0000110" WHEN 3, --Escreve 3 para o display
											"1001100" WHEN 4, --Escreve 4 para o display
											"0100100" WHEN 5, --Escreve 5 para o display
											"0100000" WHEN 6, --Escreve 6 para o display
											"0001111" WHEN 7, --Escreve 7 para o display
											"0000000" WHEN 8, --Escreve 8 para o display
											"0000100" WHEN 9, --Escreve 9 para o display
											"0000001" WHEN 10, --Escreve 10 para o display
											"1001111" WHEN 11, --Escreve 11 para o display
											"0010010" WHEN 12, --Escreve 12 para o display
											"0000110" WHEN 13, --Escreve 13 para o display
											"1001100" WHEN 14, --Escreve 14 para o display
											"1001111" WHEN OTHERS; -- Espaço vazio quando outros
	with fase select
			seven_seg_scoreDez <= "0000001" WHEN 0, --Escreve 0 para o display
										 "0000001" WHEN 1, --Escreve 0 para o display
										 "0000001" WHEN 2, --Escreve 0 para o display
										 "0000001" WHEN 3, --Escreve 0 para o display
										 "0000001" WHEN 4, --Escreve 0 para o display
										 "0000001" WHEN 5, --Escreve 0 para o display
										 "0000001" WHEN 6, --Escreve 0 para o display
										 "0000001" WHEN 7, --Escreve 0 para o display
										 "0000001" WHEN 8, --Escreve 0 para o display
										 "0000001" WHEN 9, --Escreve 0 para o display
										 "1001111" WHEN 10, --Escreve 1 para o display
										 "1001111" WHEN 11, --Escreve 1 para o display
										 "1001111" WHEN 12, --Escreve 1 para o display
										 "1001111" WHEN 13, --Escreve 1 para o display
										 "1001111" WHEN 14, --Escreve 1 para o display
										 "0100000" when others;
									
--WITH acendeled SELECT --Utiliza o comando SELECT em função da entrada cont.
	--		LEDS <=                 "0001" WHEN 1, --Escreve 0 para o display
		--									"0100" WHEN 2, --Escreve 1 para o display
			--								"0010" WHEN 3, --Escreve 2 para o display
				--							"0001" WHEN 4, --Escreve 3 para o display
					--						"0000" WHEN OTHERS; --Escreve 4 para o display
											
end Behavioral;

