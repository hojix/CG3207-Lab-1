----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:14:34 09/17/2014 
-- Design Name: 
-- Module Name:    full_system - Behavioral 
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

entity full_system is
    Port ( systemRst : in  STD_LOGIC;
           systemOp1 : in  STD_LOGIC;
           systemOp2 : in  STD_LOGIC;
           systemClk : in  STD_LOGIC;
           systemDispHi : in  STD_LOGIC;
           systemLED : out  STD_LOGIC_VECTOR (3 downto 0));
end full_system;

architecture structural of full_system is

component rom is
port (	addr : in  STD_LOGIC_VECTOR (7 downto 0);
			data : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component addsub is
port (	data : in  STD_LOGIC_VECTOR (7 downto 0);
			control : in  STD_LOGIC_VECTOR (2 downto 0);
			result : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component comparator is
port (	data : in  STD_LOGIC_VECTOR (7 downto 0);
			result : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component counter is
port (	clk : in STD_LOGIC;
			control : in  STD_LOGIC_VECTOR (2 downto 0);
			addr : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component display is
port (	result : in  STD_LOGIC_VECTOR (7 downto 0);
			dispHi : in  STD_LOGIC;
			display : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component state_machine is
port (	rst : in  STD_LOGIC;
			op1 : in  STD_LOGIC;
			op2 : in  STD_LOGIC;
			clk : in STD_LOGIC;
			comResult : in  STD_LOGIC_VECTOR (1 downto 0);
			control : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

signal systemAddr, systemData, systemASResult : STD_LOGIC_VECTOR (7 downto 0);
signal systemControl : STD_LOGIC_VECTOR (2 downto 0);
signal systemComResult : STD_LOGIC_VECTOR (1 downto 0);

begin
system_rom : rom port map (systemAddr, systemData);
system_addsub : addsub port map (systemData, systemControl, systemASResult);
system_comparator : comparator port map (systemData, systemComResult);
system_counter : counter port map (systemClk, systemControl, systemAddr);
system_display : display port map (systemASResult, systemDispHi, systemLED);
system_state_machine : state_machine port map (systemRst, systemOp1, systemOp2, systemClk, systemComResult, systemControl);

end structural;

