transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/lab2/counter/RTL {D:/colleage/fpga/lab2/counter/RTL/counter.v}

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/lab2/counter/Quartus_prj/../Sim {D:/colleage/fpga/lab2/counter/Quartus_prj/../Sim/tb_counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_counter

add wave *
view structure
view signals
run 1 us
