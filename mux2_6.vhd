library ieee;
use ieee.std_logic_1164.all;

entity mux2_6 is
    port (
        in0  : in  std_logic_vector(5 downto 0); 
        in1  : in  std_logic_vector(5 downto 0); 
        sel  : in  std_logic;                   --s0, s1--
        dout : out std_logic_vector(5 downto 0)  
    );
end mux2_6;

architecture dataflow of mux2_6 is
begin

    dout <= in0 when sel = '0' else in1;

end dataflow;
