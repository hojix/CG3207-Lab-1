--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:46:40 09/17/2014
-- Design Name:   
-- Module Name:   D:/cg3207labhw/test_full_system.vhd
-- Project Name:  cg3207labhw
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_system
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
use IEEE.STD_LOGIC_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_full_system IS
END test_full_system;
 
ARCHITECTURE behavior OF test_full_system IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_system
    PORT(
         systemRst : IN  std_logic;
         systemOp1 : IN  std_logic;
         systemOp2 : IN  std_logic;
         systemClk : IN  std_logic;
         systemDispHi : IN  std_logic;
         systemLED : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal systemRst : std_logic := '0';
   signal systemOp1 : std_logic := '0';
   signal systemOp2 : std_logic := '0';
   signal systemClk : std_logic := '0';
   signal systemDispHi : std_logic := '0';

 	--Outputs
   signal systemLED : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant systemClk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_system PORT MAP (
          systemRst => systemRst,
          systemOp1 => systemOp1,
          systemOp2 => systemOp2,
          systemClk => systemClk,
          systemDispHi => systemDispHi,
          systemLED => systemLED
        );

   -- Clock process definitions
   systemClk_process :process
   begin
		systemClk <= '0';
		wait for systemClk_period/2;
		systemClk <= '1';
		wait for systemClk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for systemClk_period*10;

      -- insert stimulus here 
		wait for 25 ns;
		systemRst <= '1';
		systemOp1 <= '0';
		systemOp2 <= '0';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '0';
		systemOp2 <= '1';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '1';
		systemOp2 <= '0';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '0';
		systemOp2 <= '1';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '1';
		systemOp2 <= '0';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '0';
		systemOp2 <= '1';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '1';
		systemOp2 <= '0';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '0';
		systemOp2 <= '1';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '1';
		systemOp2 <= '0';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '1';
		systemOp2 <= '1';
		
		wait for 100 ns;
		systemRst <= '0';
		systemOp1 <= '0';
		systemOp2 <= '0';

      wait;
   end process;

END;
