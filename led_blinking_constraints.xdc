set_property PACKAGE_PIN H16 [get_ports i_clk]
set_property IOSTANDARD LVCMOS33 [get_ports i_clk]

set_property PACKAGE_PIN M20 [get_ports i_sw1]
set_property IOSTANDARD LVCMOS33 [get_ports i_sw1]

set_property PACKAGE_PIN M19 [get_ports i_sw2]
set_property IOSTANDARD LVCMOS33 [get_ports i_sw2]

set_property PACKAGE_PIN D19 [get_ports i_enable]
set_property IOSTANDARD LVCMOS33 [get_ports i_enable]

set_property PACKAGE_PIN R14 [get_ports led_drive]
set_property IOSTANDARD LVCMOS33 [get_ports led_drive]


create_clock -period 8.000 -name i_clk -waveform {0.000 4.000} -add [get_ports i_clk]
