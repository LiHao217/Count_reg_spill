#pragma once
  
#include <string>  
#include <iostream>  

using namespace std;


#define Code_part 10
#define Max_Loop_Num 2000
#define Max_Fun_Num 1000
#define Max_Basic_Black_Num 5000

class Function {
	public:
		int Begin = 0;
		int End = 0;
		int Split_Num = 0;
		int Line_Num = 0;
		string Name = "";
		
};

class Loop 
{
	public:
		string Begin = "";
		string End = "";
		int Begin_int = 0;
		int End_int = 0;
		int Split_Num = 0;
		string Fun_Name = "";
		int Loop_No = 0;
		//Loop();
};/*

Loop::Loop(void)
{
	string Begin = 0;
	string End = 0;
	int Split_Num = 0;
	string Fun_Name = "";
	int Loop_No = 0;
}*/
class Basic_Black
{
public:
	string Basic_Black_Name = "";
	int Line_Num = 0;
};

int Spill_Count_Objdump(string filepath, string Function_Output_Excel_path, string Loop_Output_Excel_path, bool Remove_Library_Function);
int Spill_Count_Compile(string filepath, string Function_Output_Excel_path, string Loop_Output_Excel_path, bool Remove_Library_Function, string Compiler);
//int Aocc_Spill_Count_Compile(string filepath, string Function_Output_Excel_path, string Loop_Output_Excel_path, bool Remove_Library_Function);
int Spill_Count_By_Line_Num(string filepath, string Begin_Line_Num_str, string End_Line_Num_str);
int Spill_Count_By_Line_Num(string filepath, int Begin_Line_Num_int, int End_Line_Num_int);
Basic_Black *Find_Basic_Black(string filepath);