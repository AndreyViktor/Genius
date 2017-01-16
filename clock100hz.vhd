------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------

entity Clock100hz is
PORT(
			clk: in std_logic;
			genericfreq: in integer range 0 to 12_500_000; --cria um divisor gen�rico
			newclk: out std_logic--cria��o de vari�vel para nova frequencia de clock
			);

end Clock100hz;

---------------------------------------
architecture Behavioral of Clock100hz is
   signal sum: integer :=0; --divisor de clock
	signal nclk: std_logic :='0';
----------------------------------------
begin

newclk <= nclk; --atribui valor do sinal para sa�da

	process(clk)
	begin
		if rising_edge(clk) then --Verificando a batida de subida do clock
			sum <= sum +1;
			if(sum = genericfreq)then --if para realizar a divis�o do clock 
				nclk <= not nclk;--alterna o sinal em 0 e 1.
				sum <= 0;--recome�a a contagem de soma.
			end if;
		end if;
	end process;
	
end Behavioral;

