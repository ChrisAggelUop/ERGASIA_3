library ieee;
use ieee.std_logic_1164.all;


entity mux4_6 is
    port(
        a0  : in  std_logic_vector(5 downto 0);   --1--
        a1  : in  std_logic_vector(5 downto 0);   --Ζ--
        a2  : in  std_logic_vector(5 downto 0);   --Ζ'--
        a3  : in  std_logic_vector(5 downto 0);   --0--
        sel : in  std_logic_vector(1 downto 0);    --το Cond--
        y   : out std_logic_vector(5 downto 0)
    );
end mux4_6;

architecture arc_mux4 of mux4_6 is
begin
    process(a0, a1, a2, a3, sel)
    begin
        case sel is
            when "00" => y <= a0;
            when "01" => y <= a1;
            when "10" => y <= a2;
            when others => y <= a3;
        end case;
    end process;
end arc_mux4;


