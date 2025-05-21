library ieee;
use ieee.std_logic_1164.all;

entity encoder42_tb is
end encoder42_tb;

architecture testbench of encoder42_tb is
--missing
component encoder42 is
        PORT (
        i : in  std_logic_vector(3 downto 0);
		y : out std_logic_vector(1 downto 0)
        );
     end component;
     
        signal ii : std_logic_vector(3 DOWNTO 0); 
        signal yy: std_logic_vector(1 DOWNTO 0);

begin
    encoder: encoder42 port map(i => ii, y => yy);

    process begin
    
        ii <= "0001";
        wait for 10 ns;
        ii <= "0010";
        wait for 10 ns;
        ii <= "0100";
        wait for 10 ns;
        ii <= "1000";
        wait for 10 ns;
        ii <= "1100";
        wait for 10 ns;
        ii <= "1011";
        wait for 10 ns;
          
        
        wait;
    end process;
	
end testbench;