----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:12:27 09/16/2014 
-- Design Name: 
-- Module Name:    state_machine - state_machine_architecture 
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

entity state_machine is
    Port ( rst : in  STD_LOGIC;
           op1 : in  STD_LOGIC;
           op2 : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           comResult : in  STD_LOGIC_VECTOR (1 downto 0);	--result from comparator
           control : out  STD_LOGIC_VECTOR (2 downto 0));	--control to addsub and counter
end state_machine;

architecture state_machine_architecture of state_machine is
type states is (RESET, UP, DOWN, IDLE);
signal state, n_state : states;
begin
--synchronous process
process (clk, rst)
begin
	if rst ='1' then
		state <= RESET;
	elsif rising_edge(clk) then
		state <= n_state;
	end if;
end process;

process (op1, op2, state, comResult)
begin
	
	n_state <= IDLE;
	control <= "000";
	
	case state is
	
		when RESET =>
			n_state <= IDLE;
			control <= "100";
		
		when IDLE =>
			if op1 = '0' and op2 = '1' then	--convert to lower case
				n_state <= DOWN;
				if comResult = "10" then		--data is uppercase
					control <= "001";
				else									--data is lowercase or not an alphabet
					control <= "000";
				end if;
			elsif op1 = '1' and op2 = '0' then	--convert to upper case
				n_state <= UP;
				if comResult = "01" then			--data is lowercase
					control <= "010";
				else										--data is uppercase or not an alphabet
					control <= "000";
				end if;
			else
				control <= "000";
			end if;
		
		when UP =>
			if op1 = '0' and op2 = '1' then		--convert to lower case
				n_state <= DOWN;
				if comResult = "10" then			--data is uppercase
					control <= "001";
				else
					control <= "000";
				end if;
			elsif op1 = '1' and op2 = '0' then	--convert to upper case
				n_state <= UP;
				control <= "000";
			else
				n_state <= IDLE;
				control <= "000";
			end if;
		
		when DOWN =>
			if op1 = '0' and op2 = '1' then		--convert to lower case
				n_state <= DOWN;
				control <= "000";
			elsif op1 = '1' and op2 = '0' then	--convert to upper case
				n_state <= UP;
				if comResult = "01" then
					control <= "010";
				else
					control <= "000";
				end if;
			else
				n_state <= IDLE;
				control <= "000";
			end if;
		
		when others =>
			n_state <= IDLE;
			control <= "000";

	end case;
end process;
end state_machine_architecture;

