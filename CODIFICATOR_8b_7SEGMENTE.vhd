library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;

entity CODIFICATOR_8b_7SEGMENTE is
	port(
		a: in std_logic_vector(7 downto 0);
		q: out std_logic_vector(6 downto 0)
		);
end CODIFICATOR_8b_7SEGMENTE;

architecture ARH_CODIFICATOR_8b_7SEGMENTE of CODIFICATOR_8b_7SEGMENTE is
begin
	process(a)
	begin
		case a is	
			when x"45" => q <= "0000001";  --0
			when x"16" => q <= "1001111";  --1
			when x"1E" => q <= "0010010";  --2
			when x"26" => q <= "0000110";  --3
			when x"25" => q <= "1001100";  --4
			when x"2E" => q <= "0100100";  --5
			when x"36" => q <= "0100000";  --6
			when x"3D" => q <= "0001111";  --7
			when x"3E" => q <= "0000000";  --8
			when x"46" => q <= "0000100";  --9
			when x"1C" => q <= "0001000";  --A
			when x"32" => q <= "1100000";  --b
			when x"21" => q <= "0110001";  --C
			when x"23" => q <= "1000010";  --d
			when x"24" => q <= "0110000";  --E
			when x"2B" => q <= "0111000";  --F
			when x"33" => q <= "1001000";  --H
			when x"43" => q <= "1001111";  --I
			when x"3B" => q <= "1000111";  --J	
			when x"4B" => q <= "1110001";  --L
			when x"44" => q <= "0000001";  --O
			when x"4D" => q <= "0011000";  --P 
			when x"2D" => q <= "1111010";  --r
			when x"1B" => q <= "0100100";  --S 
			when x"2C" => q <= "1110000";  --t 
			when x"3C" => q <= "1000001";  --U 
			when x"35" => q <= "1000100";  --y
			when x"55" => q <= "0111110";  --=
			when x"54" => q <= "0110001";  --[
			when x"5B" => q <= "0000111";  --]
			when others => q <= "1111111";
		end case;
	end process;	
end ARH_CODIFICATOR_8b_7SEGMENTE;
