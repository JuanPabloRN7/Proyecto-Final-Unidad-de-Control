-- Jainer Pinta
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regb5 is
    Port ( cs : in  STD_LOGIC_VECTOR (4 downto 0);
           clk, reset : in  STD_LOGIC;
           datoin : in  STD_LOGIC_VECTOR (3 downto 0);
           b : inout  STD_LOGIC_VECTOR (3 downto 0));
end regb5;

architecture impedancia of regb5 is
begin
	process (clk, cs, reset)
		variable bres : std_logic_vector (3 downto 0);
	begin
		if reset = '1' then
			b <= "0000";
		 else if (clk'event and clk = '1') then
				case cs is
					when "10010" => b <= datoin;
					when "11100" => bres := b;
					when "11101" =>b <= bres;
					when others => null;
				end case;
			end if;
		end if;
	end process;	
end impedancia;

