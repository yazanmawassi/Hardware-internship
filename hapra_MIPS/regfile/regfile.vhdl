-- Some portions of this code are based on code from the book "Digital Design and Computer Architecture" by Harris and Harris.
-- For educational purposes in TU Dortmund only.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regfile is
  port (
    clk: in std_logic;
    we3: in std_logic;
    a1: in std_logic_vector(4 downto 0);
    a2: in std_logic_vector(4 downto 0);
    a3: in std_logic_vector(4 downto 0);
    wd3: in std_logic_vector(31 downto 0);
    rd1: buffer std_logic_vector(31 downto 0);
    rd2: buffer std_logic_vector(31 downto 0)
  );
end;

architecture behavior of regfile is
  type ramtype is array (31 downto 0) of std_logic_vector(31 downto 0); -- 32 array of 32 bits !! 
  signal mem: ramtype;
begin
  process(clk) begin
    if rising_edge(clk) then
      if we3 = '1' then mem(to_integer(unsigned(a3))) <= wd3; -- Also wenn tackt geht nach oben und gleichzeitig ist we3 1 ist :- dann müssen wir schreiben
      end if;
    end if;
  end process;

  process(a1, a2) begin -- wenn beide a1 und a2 der wert ändert ! hier müssen wir lesen !!
    if (to_integer(unsigned(a1)) = 0) then rd1 <= x"00000000";
    else rd1 <= mem(to_integer(unsigned(a1))); -- specihern wir den a1 integer array of 32 bits in rd1
    end if;
    -- hier wieder müssen wir lesesn
    if (to_integer(unsigned(a2)) = 0) then rd2 <= x"00000000";-- specihern wir den a2 integer array of 32 bits in rd2
    else rd2 <= mem(to_integer(unsigned(a2)));
    end if;
  end process;
end;
