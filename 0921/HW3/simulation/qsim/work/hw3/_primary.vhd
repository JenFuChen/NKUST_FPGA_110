library verilog;
use verilog.vl_types.all;
entity hw3 is
    port(
        CLK             : in     vl_logic;
        up              : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0);
        RST             : in     vl_logic
    );
end hw3;
