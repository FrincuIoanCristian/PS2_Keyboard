library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity REGISTRU is
	Port ( 
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		load : in STD_LOGIC;
		make_code : in STD_LOGIC_VECTOR (7 downto 0);
		Q : out STD_LOGIC_VECTOR (7 downto 0)
		);
end REGISTRU;

architecture ARH_REGISTRU of REGISTRU is	
	signal M: STD_LOGIC_VECTOR(7 downto 0);	
begin
	process (clk, reset)
	begin 
		if reset = '1' then
			M <= (others => '0');
		elsif clk = '1' and clk'event then
			if load = '1' then
				M <= make_code;
			end if;
		end if;
	end process;
	Q <= M;
end ARH_REGISTRU;
