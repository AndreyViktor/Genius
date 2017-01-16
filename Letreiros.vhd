
------------------Bibliotecas utilizadas---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Letreiros is
port (
      Start: 			 in std_logic	:='0';
		clk: 				 in std_logic	:='0';
		anode: 		  	 out std_logic_vector(3 downto 0) :=(others => '0');--setar anodo led
		seven_seg: 		 out std_logic_vector(6 downto 0) :=(others => '0');--recebe valor para displa	
      botaoReset:     in std_logic	:= '0';
      --LEDS:           out std_logic_vector(3 downto 0);
		--acendeled:      in integer range 0 to 4;
--		num:          in integer range 0 to 13;
		fase:         in integer range 0 to 100
		);
end Letreiros;


architecture Behavioral of Letreiros is

--------------------------------------------------COMPONENTE DO CLOCK-----------------------------------------------
component Clock1hz is
	PORT(
			clk: in std_logic;
			genericfreq: in integer range 0 to 12_500_000; --cria um divisor genérico
			newclk: out std_logic--criação de um novo contador
			);
END component;

component Clock100hz is
	PORT(
			clk: in std_logic;
			genericfreq: in integer range 0 to 12_500_000; --cria um divisor genérico
			newclk: out std_logic--criação de um novo contador
			);
END component;
---------------------------------------------------------------------------------------------------------------------
----------------------------------------------COMPONENTE DO DECODER--------------------------------------------------
component Decoder1 is
	PORT(
			caracter: in character; 
			fase: in integer range 0 to 100;
			seven_seg_caracter: out std_logic_vector (6 downto 0);
			seven_seg_numero: out std_logic_vector(6 downto 0);
			seven_seg_scoreDez:out std_logic_vector(6 downto 0)
			--LEDS: out std_logic_vector (3 downto 0);
			--acendeled: in integer range 0 to 4	
			);
END component;
----------------------------------------------------------------------------------------------------------------------
---------------------------SIGNAL PARA DECODER------------------------------------------------------
signal 		seven_seg_caracter:  std_logic_vector(6 downto 0);
signal 		seven_seg_numero:    std_logic_vector(6 downto 0);
signal 		seven_seg_scoreDez:	std_logic_vector(6 downto 0);
constant 	mensagem_inicial: 	string(1 to 21) := "PROJETO APLICATIVO AF";
constant 	mensagem_fail:		 	string(1 to 21) := "FAIL FAIL FAIL FAIL F";
constant		mensagem_win: 			string(1 to 21) := "GOOD GAME GOOD GAME G";
signal 		caracter: 				character;          

-------------------------CONTADORES PARA DISPLAY-----------------------------------------------
signal 		contador_disp1: 	integer range 0 to 20 := 1;
signal 		contador_disp2: 	integer range 0 to 20 := 1;
signal		contador_disp3:	integer range 0 to 20 := 1;
signal 		contador_disp4:	integer range 0 to 20 := 1;
signal 		selectanode: 		integer range 0 to 3 := 0; --decidir qual anodo vai ligar

--------------------------------------------CLOCK-----------------------------------------------
constant generic1hz:  integer:= 12_500_000;
constant generic100hz: integer:= 25_000;
signal clk1hz: std_logic:= '0';
signal clk100hz: std_logic:= '0';
------------------------------------------------------------------------------------------------

begin
--------------------------PORT MAP DECODER-------------------------------------------------
 DecoderA: Decoder1 PORT MAP (
										caracter => caracter,
										fase => fase,
										seven_seg_caracter => seven_seg_caracter,
									   seven_seg_numero => seven_seg_numero,
										seven_seg_scoreDez => seven_seg_scoreDez
										--LEDS => LEDS,
										--acendeled => acendeled,
										
									);	
---------------------------PORT MAP CLOCK1hz--------------------------------------------
 Clocka: Clock1hz PORT MAP (
								clk => clk,
								genericfreq => generic1hz,
								newclk => clk1hz
								);		 
----------------------------PORT MAP CLOCK1hz--------------------------------------------
 Clockb: Clock100hz PORT MAP (
								clk => clk,
								genericfreq => generic100hz,
								newclk => clk100hz
								);


-----------------------PROCESSO PARA ALTENAR DISPLAY-------------------------------------
	PROCESS (clk100hz)
		BEGIN
		IF rising_edge(clk100hz) THEN
----------------------------Mensagem Inicial---------------------------------------------
			IF Start = '0' THEN
				CASE selectanode IS -- função case que depENDe do selecanode para alterea anodos
					WHEN 0 => anode <= "1110";
						selectanode <= selectanode + 1;
						caracter <= mensagem_inicial(contador_disp1);
						seven_seg <= seven_seg_caracter;
					WHEN 1 => anode <= "1101";
						selectanode <= selectanode + 1;
						caracter <= mensagem_inicial(contador_disp2);
						seven_seg <= seven_seg_caracter;
					WHEN 2 => anode <= "1011";
						selectanode <= selectanode + 1;
						caracter <= mensagem_inicial(contador_disp3);
						seven_seg <= seven_seg_caracter;
					WHEN 3 => anode <= "0111";
						selectanode <= 0;
						caracter <= mensagem_inicial(contador_disp4);
						seven_seg <= seven_seg_caracter;
					WHEN OTHERS => anode <= "0000";
				END CASE;
				elsif(Start = '1') then 
					if(fase<15)then
						case selectanode is
						when 0 => anode <= "0111";
									selectanode <=1;
									seven_seg <= seven_seg_numero;
						when 1 => anode <= "1110";
									 selectanode <=0;
									 seven_seg <= seven_seg_scoreDez;
						 when 2 => anode <= "1011";
						 when 3 => anode <= "1101";
						 end case;
				 elsif(fase=15)then
						case selectanode is
							WHEN 0 => anode <= "1110";
								selectanode <= selectanode + 1;
								caracter <= mensagem_win(contador_disp1);
								seven_seg <= seven_seg_caracter;
							WHEN 1 => anode <= "1101";
								selectanode <= selectanode + 1;
								caracter <= mensagem_win(contador_disp2);
								seven_seg <= seven_seg_caracter;
							WHEN 2 => anode <= "1011";
								selectanode <= selectanode + 1;
								caracter <= mensagem_win(contador_disp3);
								seven_seg <= seven_seg_caracter;
							WHEN 3 => anode <= "0111";
								selectanode <= 0;
								caracter <= mensagem_win(contador_disp4);
								seven_seg <= seven_seg_caracter;
							WHEN OTHERS => anode <= "0000";
					end case;
				elsif(fase > 15)then
					case selectanode is
						WHEN 0 => anode <= "1110";
							selectanode <= selectanode + 1;
							caracter <= mensagem_fail(contador_disp1);
							seven_seg <= seven_seg_caracter;
						WHEN 1 => anode <= "1101";
							selectanode <= selectanode + 1;
							caracter <= mensagem_fail(contador_disp2);
							seven_seg <= seven_seg_caracter;
						WHEN 2 => anode <= "1011";
							selectanode <= selectanode + 1;
							caracter <= mensagem_fail(contador_disp3);
							seven_seg <= seven_seg_caracter;
						WHEN 3 => anode <= "0111";
							selectanode <= 0;
							caracter <= mensagem_fail(contador_disp4);
							seven_seg <= seven_seg_caracter;
						WHEN OTHERS => anode <= "0000";
					end case;
				 end if;
				end if;
		end if;
			
			
		end process;

------------------------------PROCESSO CONTAR O TEMPO-----------------------------------
PROCESS (clk1hz,botaoReset)
	BEGIN
		IF botaoReset = '1' and Start = '1' THEN --Reset geral
    		contador_disp1 <=1; contador_disp2 <=0;
			contador_disp3 <=0; contador_disp4 <=0;
			
		ELSIF botaoReset = '0' THEN
	
			IF rising_edge(clk1hz) THEN
				contador_disp1 <= contador_disp1 + 1;
				
					IF (contador_disp1 > 0) THEN
						contador_disp2 <= contador_disp2 + 1;
					END IF;
					
					IF (contador_disp2 > 0) THEN
						contador_disp3 <= contador_disp3 + 1;
					END IF;
					
					IF (contador_disp3 > 0) THEN
						contador_disp4 <= contador_disp4 + 1;
					END IF;
					
					IF (contador_disp4 = 20) THEN --Reset de mensagem
						contador_disp1 <=1; contador_disp2 <=0;
						contador_disp3 <=0; contador_disp4 <=0;
					END IF;	
			END IF;
		END IF;
	END PROCESS;
------------------------------------------------------------------------------
end Behavioral;


