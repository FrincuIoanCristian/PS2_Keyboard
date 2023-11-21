library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity REGISTRU_11B is
	port(
		clk: in std_logic;
		ser: in std_logic;
		reset: in std_logic;
		load: in std_logic;
		q: out std_logic_vector(10 downto 0)
		);
end REGISTRU_11B;

architecture ARH_REGISTRU_11B of REGISTRU_11B is  
	signal aux: std_logic_vector(10 downto 0);
begin
	process(clk, reset, load)
	begin
		if reset = '1' then 
			aux <= (others => '0');
		elsif load = '1' then
			aux <= (others => '1');
		elsif falling_edge(clk) then	   
			aux(9 downto 0)<=aux(10 downto 1);
			aux(10) <=ser;
		end if;		
	end process; 
	q <= aux;
end ARH_REGISTRU_11B;
