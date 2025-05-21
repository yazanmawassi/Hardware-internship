library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port (
    a : in std_logic;
    b : in std_logic;
	cin : in std_logic;
    cout : out std_logic;
    sum :out std_logic	
  );
end fa;

architecture rtl of fa is
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
begin
-- hier sind die zwei outputs (sum,cout)


   sum <= a xor b xor cin ;
   cout <= ( a and b ) or ((a xor b ) and cin );

end rtl;
