onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/rst_n
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/clk
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/start_tb
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/element_tb
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/expected_index
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/index_tb
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/found_tb
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/not_found_tb
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/i
add wave -noupdate -expand -group TB -radix unsigned /binary_search_tb/tests
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/clk
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/rst_n
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/start
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/in_data
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/element
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/index
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/found
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/not_found
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/eq
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/gt
add wave -noupdate -expand -group TOP -radix unsigned /binary_search_tb/binary_search_inst/center
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/clk
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/rst_n
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/start
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/eq
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/gt
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/found
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/not_found
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/center
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/found_nx
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/found_r
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/not_found_nx
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/not_found_r
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/center_nx
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/center_r
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/left_corner_nx
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/left_corner_r
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/right_corner_nx
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/right_corner_r
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/current_state
add wave -noupdate -expand -group Controller -radix unsigned /binary_search_tb/binary_search_inst/binary_search_controller_inst/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {72 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 380
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {238 ns}
