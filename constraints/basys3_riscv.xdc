# Clock (W5)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin [get_ports clk]

# Reset (U18)
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# LEDs (U16 to L1)
set_property PACKAGE_PIN U16 [get_ports {core_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {core_out[0]}]
# ... (Include all 16 pins for core_out[0] through core_out[15])

create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} -add [get_ports clk]
