#pragma once
  
#include <string>  
#include <iostream>  

using namespace std;


#define Code_part 10
#define Max_Loop_Num 200
#define Max_Fun_Num 100

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


int Spill_Count(string filepath);

int Spill_Count_By_Line_Num(string filepath, string Begin_Line_Num_str, string End_Line_Num_str);