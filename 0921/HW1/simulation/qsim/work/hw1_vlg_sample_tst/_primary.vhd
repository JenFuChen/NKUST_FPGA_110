library verilog;
use verilog.vl_types.all;
entity hw1_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end hw1_vlg_sample_tst;
