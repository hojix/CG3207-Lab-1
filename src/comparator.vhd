----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:57 09/16/2014 
-- Design Name: 
-- Module Name:    comparator - comparator_architecture 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (1 downto 0));
end comparator;
--result--
--01 lower case
--10 upper case
architecture comparator_architecture of comparator is

begin
process (data)
begin
	if data > X"40" and data < X"5B" then	--data is uppercase
		result <= "10";
	elsif data > X"60" and data < X"7B" then	--data is lowercase
		result <= "01";
	else	--data is not an alphabet
		result <= "00";
	end if;
end process;
end comparator_architecture;

