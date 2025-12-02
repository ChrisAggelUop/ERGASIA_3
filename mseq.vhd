library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mseqlib.all;

entity mseq is
    port(
        ir    : in  std_logic_vector(3 downto 0);
        clock : in  std_logic;
        reset : in  std_logic;
        z     : in  std_logic;
        code  : out std_logic_vector(35 downto 0);
        mOPs  : out std_logic_vector(26 downto 0)
    );
end mseq;

architecture arc of mseq is
    signal curr_addr  : std_logic_vector(5 downto 0) := (others => '0');
    signal next_addr  : std_logic_vector(5 downto 0) := (others => '0');
    signal rom_out    : std_logic_vector(35 downto 0);
    signal SEL        : std_logic_vector(2 downto 0);
    signal ADDR_field : std_logic_vector(5 downto 0);
begin


    rom_i: entity work.mseq_rom
        port map(
            address => curr_addr,
            clock   => clock,
            q       => rom_out
        );

    code <= rom_out;
    mOPs <= rom_out(26 downto 0);

    SEL <= rom_out(35 downto 33);
    ADDR_field <= rom_out(32 downto 27);


    process(SEL, ADDR_field, curr_addr, z, ir)
    begin

        next_addr <= std_logic_vector(unsigned(curr_addr) + 1);
        case SEL is
            when "000" => 
                next_addr <= ADDR_field;
            when "001" =>  
                next_addr <= std_logic_vector(unsigned(curr_addr) + 1);
            when "010" =>  
                if z = '1' then
                    next_addr <= ADDR_field;
                else
                    next_addr <= std_logic_vector(unsigned(curr_addr) + 1);
                end if;
            when "011" => 
                if ir = "0000" then
                    next_addr <= ADDR_field;
                else
                    next_addr <= std_logic_vector(unsigned(curr_addr) + 1);
                end if;
            when others =>
                next_addr <= ADDR_field;
        end case;
    end process;


    pc_reg: entity work.regn
        generic map(n => 6)
        port map(
            D     => next_addr,
            reset => reset,
            clock => clock,
            load  => '1',
            Q     => curr_addr
        );

end arc;

