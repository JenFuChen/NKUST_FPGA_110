library verilog;
use verilog.vl_types.all;
entity hw1 is
    port(
        CLK             : in     vl_logic;
        en              : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0);
        rst             : in     vl_logic
    );
end hw1;
