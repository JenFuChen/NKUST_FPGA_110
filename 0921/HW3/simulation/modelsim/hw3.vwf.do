vlog -work work C:/Users/dht98/iCloudDrive/NKUST/FPGA/0921/HW3/simulation/modelsim/hw3.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.hw3_vlg_vec_tst
onerror {resume}
add wave {hw3_vlg_vec_tst/i1/CLK}
add wave {hw3_vlg_vec_tst/i1/RST}
add wave {hw3_vlg_vec_tst/i1/count}
add wave {hw3_vlg_vec_tst/i1/count[3]}
add wave {hw3_vlg_vec_tst/i1/count[2]}
add wave {hw3_vlg_vec_tst/i1/count[1]}
add wave {hw3_vlg_vec_tst/i1/count[0]}
add wave {hw3_vlg_vec_tst/i1/up}
run -all
