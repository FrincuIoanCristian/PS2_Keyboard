library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity NUMARATOR_16b is	
	port(
		Clk: in std_logic;
		Qout: out std_logic_vector(1 downto 0)
		); 
end NUMARATOR_16b;

architecture ARH_NUMARATOR_16b of NUMARATOR_16b is 
	signal Q: std_logic_vector(15 downto 0) := (others => '0'); 
begin													  
	process(Clk, Q)
	begin 
		if Clk = '1' and Clk'event then
			Q <= Q + 1;
		end if;
		Qout <= Q(15 downto 14);	
	end process;	
end ARH_NUMARATOR_16b;
