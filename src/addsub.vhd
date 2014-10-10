----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:51 09/16/2014 
-- Design Name: 
-- Module Name:    addsub - addsub_architecture 
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

entity addsub is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           control : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end addsub;
--control--
--MSB is reset bit
--001 convert to lower add 20
--010 convert to upper minus 20
architecture addsub_architecture of addsub is
begin
process (control, data)
begin
	if control = "001" then
		result <= data + X"20";		--convert to lowercase
	elsif control = "010" then
		result <= data - X"20";		--convert to uppercase
	elsif control = "000" or control = "011" then
		result <= data;
	else
		result <= (others => '0');	--reset
	end if;
end process;
end addsub_architecture;

