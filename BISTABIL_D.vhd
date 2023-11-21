library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity BISTABIL_D is
	port( 
		clk: in std_logic;
		reset: in std_logic;
		d: in std_logic; 
		q: out std_logic
		);
end BISTABIL_D;

architecture ARH_BISTABIL_D of BISTABIL_D is
	signal Q_out: std_logic;
begin 
	process(clk, reset)
	begin
		if reset = '1' then
			Q_out <= '0';
		elsif rising_edge(clk) then
			Q_out <= d;
		end if;	 	
	end process;
	q <= Q_out;	
end ARH_BISTABIL_D;
