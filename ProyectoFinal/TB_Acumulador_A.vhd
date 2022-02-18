-- Jainer Pinta
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Acumulador_A IS
END TB_Acumulador_A;
 
ARCHITECTURE behavior OF TB_Acumulador_A IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rega_5
    PORT(
         cs : IN  std_logic_vector(4 downto 0);
         clk : IN  std_logic;
         datoin : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         a : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cs : std_logic_vector(4 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal datoin : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';

	--BiDirs
   signal a : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rega_5 PORT MAP (
          cs => cs,
          clk => clk,
          datoin => datoin,
          reset => reset,
          a => a
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*5;
		reset <= '0';
		wait for clk_period*5;
		datoin <= "0101";
		cs <= "10001";
		wait for clk_period*5;
		cs <= "11100";
		wait for clk_period*5;
		datoin <= "1010";
		cs <= "10001";
		wait for clk_period*5;
		cs <= "11101";
		wait for clk_period*5;
		cs <= "00101";
      wait;
   end process;

END;
