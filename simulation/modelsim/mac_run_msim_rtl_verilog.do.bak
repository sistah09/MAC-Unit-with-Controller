transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/wallace_tree_multiplier.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/register_20.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/register_8.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/ksa20.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/dff.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/controller.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/add_accmulate.v}
vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/mac.v}

vlog -vlog01compat -work work +incdir+D:/Arvind/Engineering\ Material/Mini\ Project/Quartus\ Projects/verilog\ codes {D:/Arvind/Engineering Material/Mini Project/Quartus Projects/verilog codes/mac_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  mac_tb

add wave *
view structure
view signals
run -all
