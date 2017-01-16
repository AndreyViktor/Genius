--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:18:34 12/06/2016
-- Design Name:   
-- Module Name:   C:/Users/andrey/Documents/2016-2/microeletronica sibilando/genius/ProjetoFinal com vga/ProjetoFinal/decorderTest.vhd
-- Project Name:  ProjetoFinal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder1
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
 
ENTITY decorderTest IS
END decorderTest;
 
ARCHITECTURE behavior OF decorderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder1
    PORT(
         caracter : IN  std_logic;
         fase : IN  std_logic_vector(0 to 6);
         seven_seg_caracter : OUT  std_logic_vector(6 downto 0);
         seven_seg_numero : OUT  std_logic_vector(6 downto 0);
         seven_seg_scoreDez : OUT  std_logic_vector(6 downto 0);
         LEDS : OUT  std_logic_vector(3 downto 0);
         acendeled : IN  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal caracter : std_logic := '0';
   signal fase : std_logic_vector(0 to 6) := (others => '0');
   signal acendeled : std_logic_vector(0 to 2) := (others => '0');

 	--Outputs
   signal seven_seg_caracter : std_logic_vector(6 downto 0);
   signal seven_seg_numero : std_logic_vector(6 downto 0);
   signal seven_seg_scoreDez : std_logic_vector(6 downto 0);
   signal LEDS : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder1 PORT MAP (
          caracter => caracter,
          fase => fase,
          seven_seg_caracter => seven_seg_caracter,
          seven_seg_numero => seven_seg_numero,
          seven_seg_scoreDez => seven_seg_scoreDez,
          LEDS => LEDS,
          acendeled => acendeled
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
