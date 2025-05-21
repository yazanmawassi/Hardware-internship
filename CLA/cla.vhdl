library ieee;
use ieee.std_logic_1164.all;

entity cla is
  port (
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(3 downto 0)
  );
end cla;

-- a simple example for an implementation using 2 predefined components can be found in the nandgate related to exercise sheet 1
-- Ein einfaches Beispiel fuer eine Implementierung die 2 vordefinierte Komponenten verwendet kann im nandgate das Uebungsblatt 1 beilag gefunden werden

architecture rtl of cla is
  component facla is
    port (
  -- ports of the facla
      a    : in  std_logic;
      b    : in  std_logic;
      cin  : in  std_logic;
      g    : out std_logic;
      p    : out std_logic;
      sum  : out std_logic

    );
  end component facla;

  component clag is
    port(
  -- ports of the clag 
      gin  : in  std_logic_vector(3 downto 0);
      pin  : in  std_logic_vector(3 downto 0);
      cin  : in  std_logic;
      cout : out std_logic_vector(3 downto 0);
      pout : out std_logic;
      gout : out std_logic
    
    );
  end component clag;

-- signals   
  signal g , p : std_logic_vector (3 downto 0);
  signal c : std_logic_vector (3 downto 0);
  signal pout_s : std_logic; 
  signal gout_s : std_logic;


begin
-- implement cla here
    F0: facla port map (a =>a(0), b => b(0) , cin=>cin , sum=> sum(0) ,g=>g(0),p=>p(0) );
	F1: facla port map (a =>a(1), b => b(1) , cin=>c(0), sum=> sum(1) ,g=>g(1),p=>p(1) );
	F2: facla port map (a =>a(2), b => b(2) , cin=>c(1), sum=> sum(2) ,g=>g(2),p=>p(2) );
	F3: facla port map (a =>a(3), b => b(3) , cin=>c(2), sum=> sum(3) ,g=>g(3),p=>p(3) );

    clag0: clag port map(gin  => g,pin  => p ,cin  => cin ,cout => c , pout => pout_s,  gout => gout_s);

    cout <= c(3);

end rtl;
