library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity regn is
generic ( n : integer := 6 );
port( D : in std_logic_vector(n-1 downto 0);
reset, clock, load : in std_logic;
Q : out std_logic_vector(n-1 downto 0) );
end regn;


architecture arc of regn is
signal r : std_logic_vector(n-1 downto 0);
begin
process(clock, reset)
begin
if reset = '1' then
r <= (others => '0');
elsif rising_edge(clock) then
if load = '1' then
r <= D;
end if;
end if;
end process;
Q <= r;
end arc;