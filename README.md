# Vivado-Automation-Using-TCL-Scripting

This is an Automatic Library Evaluation Framework that automates the synthesis and implementation flow of the Xilinx Vivado Tool. The script takes Verilog Fles as Input and generates synthesis and implementation reports for all of them. Further, the script stores the all the important metrics in a csv file. The script is useful for automating the design and testing of FPGA projects, particularly those using Xilinx Vivado. This script is specifically designed and tested to work on CentOS systems. It may not work on other operating systems, such as Ubuntu or Windows, without additional modifications or dependencies.

Requirements
1) Xilinx Vivado(Add the path to your Vivado installation to your .bashrc file)
2) Python v3.6 or higher
3) Jupyter Lab
4) Numpy
5) Pandas

Usage
1) Clone the Repository to your local machine
3) Add your verilog/system verilog files to "Modules" folder in "Main" directory. Some examples are already present.
4) Make sure all the top modules start with the name "top_" and module and file names are same
5) Open the "Tcl_Scripting.ipynb" file using Jupyter Notebook or any other compatible notebook viewer or editor in the same directory.
6) Run the notebook to generate the synthesis and implementation results. Make sure that "Modules" , "Script" and "Tcl_Scripting.ipynb" are in the same directory before running.

Generated Outputs
1) An "Automation" folder which has a vivado project test.xpr which has all the designs added to it. It also has other files which are generated guring synthesis and implementation
2) A "result.csv" file in the same directory will be generated containing all the important metrics such as logic delay, routing delay, dynamic power etc. for all the designs
3) A folder named "Impl" will be generated that contains multiple directories. Each of these directories has the same name as the designs located in the "Modules" folder. Within each of these directories, there will be three text files named "area.txt", "power.txt", and "timing.txt" that contain reports for their respective designs. Note that the reports will be generated for only those designs whose synthesis and implementation completes without any errors. For other designs, there will be no reports in their corrosponding name directory.
4) A Program_Status.txt will be generated which will update the status of "tcl_run.tcl" execution in real time.
5) A "Log_Files" folder is generated containing the runme.log of all the designs whose either synthesis or implementation failed.
6) In case of a license error, a single log file is generated in "Log_Files" displaying the Error "A valid license is not available for synthesis". 
