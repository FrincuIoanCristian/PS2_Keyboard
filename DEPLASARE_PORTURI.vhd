library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity DEPLASARE_PORTURI is	
	port(reset: in std_logic;
		clk: in std_logic;
		DataIn: in std_logic_vector(7 downto 0); 
		N1: out std_logic_vector(7 downto 0);
		N2: out std_logic_vector(7 downto 0);
		N3: out std_logic_vector(7 downto 0);
		N4: out std_logic_vector(7 downto 0)
		);
end DEPLASARE_PORTURI;

architecture ARH_DEPLASARE_PORTURI of DEPLASARE_PORTURI is   
	signal Q1, Q2, Q3, Q4: std_logic_vector(7 downto 0);
begin
	process(reset, clk, DataIn, Q1, Q2, Q3, Q4)
	begin
		if reset = '1' then 
			Q1 <= (others => '1');
			Q2 <= (others => '1');
			Q3 <= (others => '1');
			Q4 <= (others => '1');
		elsif clk = '1' and clk'event then		   
			Q4 <= Q3;
			Q3 <= Q2;
			Q2 <= Q1;
			Q1 <= DataIn;
		end if;
		N1 <= Q1;
		N2 <= Q2;
		N3 <= Q3;
		N4 <= Q4;
	end process;	
end ARH_DEPLASARE_PORTURI;
