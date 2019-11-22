#include <fstream>  
#include <string>  
#include <iostream>  
#include "strip.h"
#include "Spill_Count.h"
using namespace std;


int main()
{
	string File_name = "605_mcf_s_aocc_2";
	string Function_Output_Excel_path = "loop_output/"+ File_name +"_Fun_Spill_Count.csv";
	string Loop_Output_Excel_path = "loop_output/" + File_name + "_Loop_Spill_Count.csv";
	string filepath = "assbemly_file/" + File_name + ".txt";
	Spill_Count(filepath, Function_Output_Excel_path, Loop_Output_Excel_path);
	return 0;
}
