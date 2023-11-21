library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity PS2 is
	port(
		ps2_clk: in std_logic;
		clk: in std_logic;
		ps2_data: in std_logic;
		reset: in std_logic;
		anozi: out std_logic_vector(3 downto 0);
		catozi: out std_logic_vector(6 downto 0)
		);
end PS2;

architecture ARH_PS2 of PS2 is
	
	component INTRODUCERE_DATE is	 
		port(
			clk_ps2: in std_logic; 
			clk: in std_logic;
			ser: in std_logic;
			Q_out: out std_logic_vector(7 downto 0);
			break_code: out std_logic
			);
	end component;
	
	component DEPLASARE_PORTURI is	
		port(reset: in std_logic;
			clk: in std_logic;
			DataIn: in std_logic_vector(7 downto 0); 
			N1: out std_logic_vector(7 downto 0);
			N2: out std_logic_vector(7 downto 0);
			N3: out std_logic_vector(7 downto 0);
			N4: out std_logic_vector(7 downto 0)
			);
	end component;
	
	component AFISOR is
		port(
			CLK_100: in std_logic;
			N1: in std_logic_vector(7 downto 0);
			N2: in std_logic_vector(7 downto 0);
			N3: in std_logic_vector(7 downto 0);
			N4: in std_logic_vector(7 downto 0);
			catozi: out std_logic_vector(6 downto 0);
			anozi: out std_logic_vector(3 downto 0)
			);
	end component;
	
	signal break_code: std_logic;
	signal data_code: std_logic_vector(7 downto 0);
	signal N1: std_logic_vector(7 downto 0);
	signal N2: std_logic_vector(7 downto 0);
	signal N3: std_logic_vector(7 downto 0);
	signal N4: std_logic_vector(7 downto 0);
	
begin
	P1: INTRODUCERE_DATE port map(ps2_clk, clk, ps2_data, data_code, break_code);
	P2: DEPLASARE_PORTURI port map(reset, break_code, data_code, N1, N2, N3, N4);
	P3: AFISOR port map(clk, N1, N2, N3, N4, catozi, anozi);	
end ARH_PS2;
