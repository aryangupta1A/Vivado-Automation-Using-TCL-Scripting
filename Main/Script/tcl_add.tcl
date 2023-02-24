#creates a new vivado project
create_project -force test [pwd]/Automation -part xc7a35tcpg236-1
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]

# loop to add all design files
foreach module_name $argv {
    add_files -norecurse [pwd]/Modules/$module_name
    update_compile_order -fileset sources_1
}
close_project
