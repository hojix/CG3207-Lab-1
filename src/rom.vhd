----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:04 09/16/2014 
-- Design Name: 
-- Module Name:    rom - rom_architecture 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0));
end rom;

architecture rom_architecture of rom is
	type rom_type is array (15 downto 0) of std_logic_vector (7 downto 0);
	signal ROM : rom_type := (	X"41", X"42", X"43", X"44", 
										X"45", X"46", X"47", X"48", 
										X"61", X"62", X"63", X"64", 
										X"65", X"66", X"67", X"68");

begin

	data <= ROM(conv_integer(addr));

end rom_architecture;

