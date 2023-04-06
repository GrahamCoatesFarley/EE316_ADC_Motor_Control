# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /repos/EE316/EE316_Digital_System_Zynq/Vitis/xtmrctr_pwm_example_1_system/_ide/scripts/systemdebugger_xtmrctr_pwm_example_1_system_standalone.tcl
# 
# 
# Usage with xsct:
# In an external shell use the below command and launch symbol server.
# symbol_server -S -s tcp::1534
# To debug using xsct, launch xsct and run below command
# source /repos/EE316/EE316_Digital_System_Zynq/Vitis/xtmrctr_pwm_example_1_system/_ide/scripts/systemdebugger_xtmrctr_pwm_example_1_system_standalone.tcl
# 
connect -path [list tcp::1534 tcp:localhost:3122]
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370B7C210A" && level==0 && jtag_device_ctx=="jsn-Cora Z7 - 7007S-210370B7C210A-13723093-0"}
fpga -file /repos/EE316/EE316_Digital_System_Zynq/Vitis/xtmrctr_pwm_example_1/_ide/bitstream/debug_run_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /repos/EE316/EE316_Digital_System_Zynq/Vitis/Digital_Syetem_debug/export/Digital_Syetem_debug/hw/debug_run_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /repos/EE316/EE316_Digital_System_Zynq/Vitis/xtmrctr_pwm_example_1/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /repos/EE316/EE316_Digital_System_Zynq/Vitis/xtmrctr_pwm_example_1/Debug/xtmrctr_pwm_example_1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
