library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity regfile_tb is
end regfile_tb;


architecture structure of regfile_tb is 

    component regfile is 
    port(
        clk: in std_logic;
	we3: in std_logic;
	a1: in std_logic_vector(4 downto 0);
	a2: in std_logic_vector(4 downto 0);
	a3: in std_logic_vector(4 downto 0);
	wd3: in std_logic_vector(31 downto 0);
	rd1: buffer std_logic_vector(31 downto 0);
	rd2: buffer std_logic_vector(31 downto 0)
    );
    end component;
    

    signal clk : std_logic := '0';
    signal we3 : std_logic := '0';
    signal a1 : std_logic_vector(4 downto 0) := (others => '0');
    signal a2 : std_logic_vector(4 downto 0) := (others => '0'); 
    signal a3 : std_logic_vector(4 downto 0) := (others => '0');
    signal wd3 : std_logic_vector(31 downto 0) := (others => '0');
    signal rd1 : std_logic_vector(31 downto 0) := (others => '0');
    signal rd2 : std_logic_vector(31 downto 0) := (others => '0');
begin
    reg : regfile port map (clk => clk, we3 => we3, a1 => a1, a2 => a2,a3 => a3, wd3 => wd3, rd1 => rd1, rd2 =>rd2);
    
process begin

	 ------Initialisierung--
	clk <= '0';
	
	wait for 10 ns;
        clk <= '1';
        we3 <= '1';
        a1 <= "00000";
        a2 <= "00000";
        a3 <= "00110";
        wd3 <= "11111111000000001111111100000000"; -- zu schreiben
        
        wait for 10 ns;
        
        clk <= '0';
        we3 <= '0';
        
	wait for 10 ns;
	
        clk <= '1';
        we3 <= '1';
        a1 <= "00000";
        a2 <= "00000";
        a3 <= "00011";
        wd3 <= "00000000111111110000000011111111"; -- zu schreiben
        
        wait for 10 ns;
        
        clk <='0';
        
        wait for 10 ns;
        
        a1 <= "00110";
        a2 <= "00011";
        
        wait for 10 ns;
        
        wait;
    end process; 

end structure;

