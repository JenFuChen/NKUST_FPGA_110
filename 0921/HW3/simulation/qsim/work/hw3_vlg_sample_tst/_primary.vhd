library verilog;
use verilog.vl_types.all;
entity hw3_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        up              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end hw3_vlg_sample_tst;
