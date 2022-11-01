library verilog;
use verilog.vl_types.all;
entity HW is
    port(
        en              : in     vl_logic;
        d1              : in     vl_logic_vector(3 downto 0);
        d2              : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic;
        dout            : out    vl_logic_vector(7 downto 0)
    );
end HW;
