-makelib xcelium_lib/xilinx_vip -sv \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_29 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_System_reset_0/sim/debug_run_System_reset_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_timer_v2_0_29 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/22b2/hdl/axi_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_axi_timer_0_0/sim/debug_run_axi_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_13 -sv \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_15 -sv \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_processing_system7_0_1/sim/debug_run_processing_system7_0_1.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_27 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_26 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_28 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_xbar_0/sim/debug_run_xbar_0.v" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
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
-endlib
-makelib xcelium_lib/xlconcat_v2_1_4 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_xlconcat_0_1/sim/debug_run_xlconcat_0_1.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_27 \
  "../../../../project_5.gen/sources_1/bd/debug_run/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/ip/debug_run_auto_pc_0/sim/debug_run_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/debug_run/sim/debug_run.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

