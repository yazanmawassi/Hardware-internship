--------- hier wird XNOR gate implementiert

library ieee;
use ieee.std_logic_1164.all;

entity xnorgate is

  port (
    input1 : in std_logic;
    input2 : in std_logic;
    xnor_result : out std_logic
  );
end xnorgate;

architecture rtl of xnorgate is

  signal xnor_gate : std_logic;
begin

  xnor_gate <= not(input1 xor input2);
  xnor_result <= xnor_gate;
end rtl;
