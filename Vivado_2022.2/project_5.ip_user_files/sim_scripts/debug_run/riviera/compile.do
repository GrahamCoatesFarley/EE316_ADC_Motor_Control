vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_29
vlib riviera/xil_defaultlib
vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_timer_v2_0_29
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_13
vlib riviera/processing_system7_vip_v1_0_15
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_27
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axi_data_fifo_v2_1_26
vlib riviera/axi_crossbar_v2_1_28
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconcat_v2_1_4
vlib riviera/axi_protocol_converter_v2_1_27

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_29 riviera/axi_gpio_v2_0_29
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_timer_v2_0_29 riviera/axi_timer_v2_0_29
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 riviera/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 riviera/processing_system7_vip_v1_0_15
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 riviera/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 riviera/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 riviera/axi_crossbar_v2_1_28
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconcat_v2_1_4 riviera/xlconcat_v2_1_4
vmap axi_protocol_converter_v2_1_27 riviera/axi_protocol_converter_v2_1_27

vlog -work xilinx_vip  -sv2k12 "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_29 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/debug_run/ip/debug_run_System_reset_0/sim/debug_run_System_reset_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_29 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/22b2/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/debug_run/ip/debug_run_axi_timer_0_0/sim/debug_run_axi_timer_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15  -sv2k12 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/debug_run/ip/debug_run_processing_system7_0_1/sim/debug_run_processing_system7_0_1.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/debug_run/ip/debug_run_xbar_0/sim/debug_run_xbar_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/debug_run/ip/debug_run_rst_ps7_0_50M_0/sim/debug_run_rst_ps7_0_50M_0.vhd" \
"../../../bd/debug_run/ip/debug_run_system_ila_0_0/bd_0/ip/ip_0/sim/bd_ff0d_ila_lib_0.vhd" \
"../../../bd/debug_run/ip/debug_run_system_ila_0_0/bd_0/sim/bd_ff0d.vhd" \
"../../../bd/debug_run/ip/debug_run_system_ila_0_0/sim/debug_run_system_ila_0_0.vhd" \
"../../../bd/debug_run/ip/debug_run_axi_gpio_0_0/sim/debug_run_axi_gpio_0_0.vhd" \
"../../../bd/debug_run/ipshared/73e3/hdl/PWM.vhd" \
"../../../bd/debug_run/ipshared/73e3/hdl/PWM_ip_v1_0_PWM_Hardware.vhd" \
"../../../bd/debug_run/ipshared/73e3/hdl/PWM_ip_v1_0.vhd" \
"../../../bd/debug_run/ip/debug_run_PWM_ip_0_0/sim/debug_run_PWM_ip_0_0.vhd" \
"../../../bd/debug_run/ip/debug_run_axi_gpio_0_1/sim/debug_run_axi_gpio_0_1.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_family_support.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_family.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_soft_reset.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_pselect_f.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_address_decoder.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/debug_run_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/debug_run_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/debug_run_xadc_wiz_0_0_axi_xadc.vhd" \
"../../../bd/debug_run/ip/debug_run_xadc_wiz_0_0/debug_run_xadc_wiz_0_0.vhd" \
"../../../bd/debug_run/ip/debug_run_axi_gpio_0_2/sim/debug_run_axi_gpio_0_2.vhd" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/debug_run/ip/debug_run_xlconcat_0_1/sim/debug_run_xlconcat_0_1.v" \

vlog -work axi_protocol_converter_v2_1_27  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../project_5.gen/sources_1/bd/debug_run/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/122e/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b205/hdl/verilog" "+incdir+../../../../project_5.gen/sources_1/bd/debug_run/ipshared/fd26/hdl/verilog" "+incdir+/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/debug_run/ip/debug_run_auto_pc_0/sim/debug_run_auto_pc_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/debug_run/sim/debug_run.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

