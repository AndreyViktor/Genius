--------------------------------------BIBLIOTECAS UTILIZADAS------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------------------------
entity Clock1hz is
 PORT(
      clk: IN STD_LOGIC;
		genericfreq: in integer range 0 to 12_500_000;
		newclk: out std_logic
		);
end Clock1hz;

-------------------------------------------------
architecture Behavioral of Clock1hz is
   signal sum: integer :=0;
   signal nclk: std_logic := '0';

-------------------------------------------------
begin
    newclk <= nclk;
	
	process(clk)
	begin
	if rising_edge(clk) then
	sum <= sum+1;
		if (sum=genericfreq) then
			nclk <= not nclk;
			sum <=0;
		end if;
	end if;
	end process;
	
end Behavioral;

