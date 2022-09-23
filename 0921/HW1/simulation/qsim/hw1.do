onerror {quit -f}
vlib work
vlog -work work hw1.vo
vlog -work work hw1.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.hw1_vlg_vec_tst
vcd file -direction hw1.msim.vcd
vcd add -internal hw1_vlg_vec_tst/*
vcd add -internal hw1_vlg_vec_tst/i1/*
add wave /*
run -all
