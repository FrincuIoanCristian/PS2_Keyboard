library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity MUX4_1_8b is	
	port(
		sel: in std_logic_vector(1 downto 0);
		I1: in std_logic_vector(7 downto 0);
		I2: in std_logic_vector(7 downto 0);
		I3: in std_logic_vector(7 downto 0);
		I4: in std_logic_vector(7 downto 0);
		Y: out std_logic_vector(7 downto 0)
		);
end MUX4_1_8b;

architecture ARH_MUX4_1_8b of MUX4_1_8b is
begin
	process(I1, I2, I3, I4, sel)
	begin
		case sel is
			when "00" => Y <= I1;
			when "01" => Y <= I2;
			when "10" => Y <= I3;
			when others => Y <= I4;
		end case;
	end process;
end ARH_MUX4_1_8b;
