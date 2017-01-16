--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:16 12/06/2016
-- Design Name:   
-- Module Name:   C:/Users/andrey/Documents/2016-2/microeletronica sibilando/genius/ProjetoFinal com vga/ProjetoFinal/testPrincipal.vhd
-- Project Name:  ProjetoFinal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Algoritimo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testPrincipal IS
END testPrincipal;
 
ARCHITECTURE behavior OF testPrincipal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Algoritimo
    PORT(
         clk : IN  std_logic;
         BCD : IN  std_logic_vector(3 downto 0);
         botaoStart : IN  std_logic;
         botaoReset : IN  std_logic;
         botaoDificuldade : IN  std_logic_vector(1 downto 0);
         seven_seg : OUT  std_logic_vector(6 downto 0);
         anode : OUT  std_logic_vector(3 downto 0);
         LEDS : OUT  std_logic_vector(3 downto 0);
         red : OUT  std_logic_vector(2 downto 0);
         green : OUT  std_logic_vector(2 downto 0);
         blue : OUT  std_logic_vector(1 downto 0);
         hs : OUT  std_logic;
         vs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal BCD : std_logic_vector(3 downto 0) := (others => '0');
   signal botaoStart : std_logic := '0';
   signal botaoReset : std_logic := '0';
   signal botaoDificuldade : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal seven_seg : std_logic_vector(6 downto 0);
   signal anode : std_logic_vector(3 downto 0);
   signal LEDS : std_logic_vector(3 downto 0);
   signal red : std_logic_vector(2 downto 0);
   signal green : std_logic_vector(2 downto 0);
   signal blue : std_logic_vector(1 downto 0);
   signal hs : std_logic;
   signal vs : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Algoritimo PORT MAP (
          clk => clk,
          BCD => BCD,
          botaoStart => botaoStart,
          botaoReset => botaoReset,
          botaoDificuldade => botaoDificuldade,
          seven_seg => seven_seg,
          anode => anode,
          LEDS => LEDS,
          red => red,
          green => green,
          blue => blue,
          hs => hs,
          vs => vs
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		botaoReset<='1';
		wait for 5 ms;
		botaoReset<='0';
		wait for 1ms;
		botaoStart<='1';
--      wait for clk_period*10;
		BCD<="0000";
		wait for 40ms;
		BCD<="0001";
		wait for 10ms;
		BCD<="0000";
		wait for 50ms;
		BCD<="0001";
		wait for 10ms;
		BCD<="0000";
		wait for 20ms;
		BCD<="0010";
		wait for 10ms;
		BCD<="0000";

      -- insert stimulus here 

      wait;
   end process;

END;
