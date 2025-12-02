library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


package mseqlib is



subtype BYTE is std_logic_vector(7 downto 0);

component regn
generic ( n : integer := 6 );
port( D : in std_logic_vector(n-1 downto 0);
reset, clock, load : in std_logic;
Q : out std_logic_vector(n-1 downto 0) );
end component;

component mux4_6
port( a0, a1, a2, a3 : in std_logic_vector(5 downto 0);
sel : in std_logic_vector(1 downto 0);
y : out std_logic_vector(5 downto 0) );
end component;

component mux2_6
port( a, b : in std_logic_vector(5 downto 0);
sel : in std_logic;
y : out std_logic_vector(5 downto 0) );
end component;

component mseq_rom
port( address : in std_logic_vector(5 downto 0);
clock : in std_logic;
q : out std_logic_vector(35 downto 0) );
end component;

end package;
