--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:57:50 02/16/2022
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Proyectos/ProyectoFinal/TB_UnidadControl.vhd
-- Project Name:  ProyectoFinal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_UnidadControl IS
END TB_UnidadControl;
 
ARCHITECTURE behavior OF TB_UnidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         irq : IN  std_logic_vector(1 downto 0);
         rw : INOUT  std_logic;
         datoin : IN  std_logic_vector(3 downto 0);
         rc : IN  std_logic_vector(3 downto 0);
         pcontrol : INOUT  std_logic_vector(7 downto 0);
         pcout : IN  std_logic_vector(7 downto 0);
         cs : INOUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal irq : std_logic_vector(1 downto 0) := (others => '0');
   signal datoin : std_logic_vector(3 downto 0) := (others => '0');
   signal rc : std_logic_vector(3 downto 0) := (others => '0');
   signal pcout : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal rw : std_logic;
   signal pcontrol : std_logic_vector(7 downto 0);
   signal cs : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          reset => reset,
          clk => clk,
          irq => irq,
          rw => rw,
          datoin => datoin,
          rc => rc,
          pcontrol => pcontrol,
          pcout => pcout,
          cs => cs
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
      wait for clk_period*2;
		reset <= '0';
		wait for clk_period*2;
		reset <= '0';
		wait for clk_period*2;
		irq <= "10";
		datoin <= "1010";
		pcout <= "01111111";
		wait for clk_period*2;
		
		
   end process;

END;
