--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:55:10 12/06/2016
-- Design Name:   
-- Module Name:   C:/Users/andrey/Documents/2016-2/microeletronica sibilando/genius/ProjetoFinal com vga/ProjetoFinal/testClock.vhd
-- Project Name:  ProjetoFinal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Clock1hz
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
 
ENTITY testClock IS
END testClock;
 
ARCHITECTURE behavior OF testClock IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Clock1hz
    PORT(
         clk : IN  std_logic;
         genericfreq: in integer range 0 to 12_500_000;
         newclk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   genericfreq: in integer range 0 to 12_500_000;

 	--Outputs
   signal newclk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant newclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Clock1hz PORT MAP (
          clk => clk,
          genericfreq => genericfreq,
          newclk => newclk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   newclk_process :process
   begin
		newclk <= '0';
		wait for newclk_period/2;
		newclk <= '1';
		wait for newclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
