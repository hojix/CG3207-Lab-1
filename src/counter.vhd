----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:02 09/16/2014 
-- Design Name: 
-- Module Name:    counter - counter_architecture 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port (	clk : in STD_LOGIC;
				control : in  STD_LOGIC_VECTOR (2 downto 0);
				addr : out  STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture counter_architecture of counter is
--control--
--MSB is reset bit
--other 2 bit is op1 and op2
begin	
process(clk)
variable count : std_logic_vector ( 7 downto 0) := (others => '0');
begin
	if rising_edge(clk) then
		if control = "000" or control = "011" then
			count := count;
		elsif control = "001" or control ="010" then
			count := count + 1;
		else
			count := (others => '0');
		end if;
	end if;
	addr <= count;
end process;
end counter_architecture;

