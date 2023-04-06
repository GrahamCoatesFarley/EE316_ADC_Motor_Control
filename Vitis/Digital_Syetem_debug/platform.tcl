# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /repos/EE316/EE316_Digital_System_Zynq/Vitis/Digital_Syetem_debug/platform.tcl
# 
# OR launch xsct and run below command.
# source /repos/EE316/EE316_Digital_System_Zynq/Vitis/Digital_Syetem_debug/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Digital_Syetem_debug}\
-hw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/repos/EE316/EE316_Digital_System_Zynq/Vitis}

platform write
platform generate -domains 
platform active {Digital_Syetem_debug}
platform generate
bsp reload
bsp reload
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform active {Digital_Syetem_debug}
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate -domains 
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate -domains 
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
platform clean
platform config -updatehw {/repos/EE316/EE316_Digital_System_Zynq/Vivado_2022.2/debug_run_wrapper.xsa}
platform generate
