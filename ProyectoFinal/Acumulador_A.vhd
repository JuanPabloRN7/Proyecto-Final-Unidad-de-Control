-- Jainer Pinta
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rega_5 is
    Port ( cs : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           datoin : in  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           a : inout  STD_LOGIC_VECTOR (3 downto 0));
end rega_5;

architecture impedancia of rega_5 is
begin
	process(clk, cs, reset)
	variable ares: std_logic_vector (3 downto 0);
	begin
		if reset = '1' then
			a <= "0000";
		else
				if (clk'event and clk = '1') then
		   case cs is
				 when "10001" => a <= datoin;
				 when "11100" => ares := a;
				 when "11101" =>a <= ares;
				 when others => null;
			 end case;
			end if;
		end if;
	end process;
end impedancia;

