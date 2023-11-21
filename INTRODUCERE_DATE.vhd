library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity INTRODUCERE_DATE is	 
	port(
		clk_ps2: in std_logic; 
		clk: in std_logic;
		ser: in std_logic;
		Q_out: out std_logic_vector(7 downto 0);
		break_code: out std_logic
		);
end INTRODUCERE_DATE;

architecture ARH_INTRODUCERE_DATE of INTRODUCERE_DATE is	 
	
	component REGISTRU_11B is
		port(
			clk: in std_logic;
			ser: in std_logic;
			reset: in std_logic;
			load: in std_logic;
			q: out std_logic_vector(10 downto 0)
			);
	end component;
	
	component BISTABIL_D is
		port( 
			clk: in std_logic;
			reset: in std_logic;
			d: in std_logic; 
			q: out std_logic
			);
	end component;
	
	component REGISTRU is
		Port ( 
			clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			load : in STD_LOGIC;
			make_code : in STD_LOGIC_VECTOR (7 downto 0);
			Q : out STD_LOGIC_VECTOR (7 downto 0)
			);
	end component;
	
	signal key, key2: std_logic;
	signal data: std_logic_vector(10 downto 0);
	signal code: std_logic_vector(7 downto 0);	
	signal break: std_logic; 
	signal key3: std_logic;
	
begin 	
	u1: REGISTRU_11B port map(clk_ps2, ser, '0', key, data);
	key2 <= not data(0);
	u2: BISTABIL_D port map(clk, '0', key2, key);
	u3: REGISTRU port map(clk, '0', key2, data(8 downto 1), code);
	break <= '1' when code = x"F0" else '0';
	key3 <= not break;
	u4: REGISTRU port map(clk, '0', key3, code, Q_out);
	break_code <= break;
end ARH_INTRODUCERE_DATE;
