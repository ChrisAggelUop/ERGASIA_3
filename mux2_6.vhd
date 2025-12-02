library ieee;
use ieee.std_logic_1164.all;

entity mux2_6 is
    port (
        in0  : in  std_logic_vector(5 downto 0); -- Είσοδος 0
        in1  : in  std_logic_vector(5 downto 0); -- Είσοδος 1
        sel  : in  std_logic;                    -- Σήμα επιλογής (1 bit)
        dout : out std_logic_vector(5 downto 0)  -- Έξοδος (6 bits)
    );
end mux2_6;

architecture dataflow of mux2_6 is
begin
    -- Όταν sel='0' δίνει έξοδο το in0, αλλιώς το in1
    dout <= in0 when sel = '0' else in1;
end dataflow;