library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity AFISOR is
	port(
		CLK_100: in std_logic;
		N1: in std_logic_vector(7 downto 0);
		N2: in std_logic_vector(7 downto 0);
		N3: in std_logic_vector(7 downto 0);
		N4: in std_logic_vector(7 downto 0);
		catozi: out std_logic_vector(6 downto 0);
		anozi: out std_logic_vector(3 downto 0)
		);
end AFISOR;

architecture ARH_AFISOR of AFISOR is
	
	component NUMARATOR_16b is	
		port(
			Clk: in std_logic;
			Qout: out std_logic_vector(1 downto 0)
			); 
	end component;
	
	component MUX4_1_4b is	
		port(
			sel: in std_logic_vector(1 downto 0);
			I1: in std_logic_vector(3 downto 0);
			I2: in std_logic_vector(3 downto 0);
			I3: in std_logic_vector(3 downto 0);
			I4: in std_logic_vector(3 downto 0);
			Y: out std_logic_vector(3 downto 0)
			);
	end component;
	
	component MUX4_1_8b is	
		port(
			sel: in std_logic_vector(1 downto 0);
			I1: in std_logic_vector(7 downto 0);
			I2: in std_logic_vector(7 downto 0);
			I3: in std_logic_vector(7 downto 0);
			I4: in std_logic_vector(7 downto 0);
			Y: out std_logic_vector(7 downto 0)
			);
	end component;
	
	component CODIFICATOR_8b_7SEGMENTE is
		port(
			a: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(6 downto 0)
			);
	end component;
	
	signal aux: std_logic_vector(7 downto 0); 
	signal Q: std_logic_vector(1 downto 0);	 
	
begin
	C1: NUMARATOR_16b port map(CLK_100, Q); 
	C2: MUX4_1_4b port map(Q, "1110", "1101", "1011", "0111", anozi);
	C3: MUX4_1_8b port map(Q, N1, N2, N3, N4, aux);
	C4: CODIFICATOR_8b_7SEGMENTE port map(aux, catozi);	
end ARH_AFISOR;
