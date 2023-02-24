open_project [pwd]/Automation/test.xpr  ##open the created vivado project

# The command allows the user to set the top module manually

set_property source_mgmt_mode None [current_project]  
update_compile_order -fileset sources_1	

#looping over all the top modules and running the synthesis and implementation

foreach module_name $argv {   
    set_property top [string trimright [lindex $module_name 0] ""] [current_fileset]
    set_property source_mgmt_mode None [current_project]
    update_compile_order -fileset sources_1

# reset and launch the synthesis. THe process waits till next command is executed

    reset_run synth_1  
    launch_runs synth_1 -jobs 12
    wait_on_run synth_1
    
# opening the runme.log to check whether any error has occured in the synthesis or not. If an error occurs, the runme.log file is saved, the program_status.txt is written with synthesis failed of that particular top modules and the script runs for rest of the modules. In case of licese error, the for loop only runs once and only one statement is printed in Program_status.txt.  

    set file_handler [open "[pwd]/Automation/test.runs/synth_1/runme.log" "r"]
    set file_contents [read $file_handler]
    close $file_handler
    
    if {[string match "*A valid license was not found*" $file_contents]} {
    set b $module_name
    set file_handler [open "Program_Status.txt" "a"]
    puts $file_handler "Error:A valid license was not found"
    close $file_handler
    set source_file "[pwd]/Automation/test.runs/synth_1/runme.log"
    set destination_file "[pwd]/Log_Files/Synthesis_Log_of_${b}.txt"
    file copy $source_file $destination_file
    break
    }

    if {[string match "*ERROR:*" $file_contents]} {
    set b $module_name
    set file_handler [open "Program_Status.txt" "a"]
    puts $file_handler "Error:Synthesis failed of $b"
    close $file_handler
    set source_file "[pwd]/Automation/test.runs/synth_1/runme.log"
    set destination_file "[pwd]/Log_Files/Synthesis_Log_of_${b}.txt"
    file copy $source_file $destination_file
    continue
    }
    
# opening the runme.log to check whether any error has occured in the implementation or not. If an error occurs, the runme.log file is saved, the program_status.txt is written with implementation failed of that particular top modules and the script runs for rest of the modules.

    reset_run impl_1
    launch_runs impl_1 -jobs 12
    wait_on_run impl_1

    set file_handler [open "[pwd]/Automation/test.runs/impl_1/runme.log" "r"]
    set file_contents [read $file_handler]
    close $file_handler

    if {[string match "*ERROR:*" $file_contents]} {
    set b $module_name
    set file_handler [open "Program_Status.txt" "a"]
    puts $file_handler "Error:Implementation failed of $b"
    close $file_handler
    set source_file "[pwd]/Automation/test.runs/impl_1/runme.log"
    set destination_file "[pwd]/Log_Files/Implementation_Log_of_${b}.txt"
    file copy $source_file $destination_file    
    continue
    }

    
# If implementation is run, the reports are generated and saved in Impl folder
    open_run impl_1
    report_power > Impl/[string trimright [lindex $module_name 0] ""]/power.txt
    report_timing > Impl/[string trimright [lindex $module_name 0] ""]/timing.txt
    report_utilization > Impl/[string trimright [lindex $module_name 0] ""]/utilization.txt
    set a $module_name
    set file_handler [open "Program_Status.txt" "a"]
    puts $file_handler "$a is implemented and reports are generated"
    close $file_handler
}
close_project
