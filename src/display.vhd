----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:58 09/17/2014 
-- Design Name: 
-- Module Name:    display - display_architecture 
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

entity display is
    Port ( result : in  STD_LOGIC_VECTOR (7 downto 0);
           dispHi : in  STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (3 downto 0));
end display;

architecture display_architecture of display is

begin
process(result, dispHi)
begin
	if dispHi = '1' then
		display <= result (7 downto 4);
	elsif dispHi ='0' then
		display <= result (3 downto 0);
	end if;
end process;
end display_architecture;

