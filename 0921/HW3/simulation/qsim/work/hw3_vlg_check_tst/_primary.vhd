library verilog;
use verilog.vl_types.all;
entity hw3_vlg_check_tst is
    port(
        count           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end hw3_vlg_check_tst;
