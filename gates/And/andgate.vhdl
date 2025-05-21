
library ieee;
use ieee.std_logic_1164.all;


entity andgate is
 
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
end andgate;


architecture rtl of andgate is
  -- internal signal, not yet connected to the outside
  signal and_gate : std_logic;
begin
  
  and_gate <= input1 and input2;
  and_result <= and_gate;

end rtl;



