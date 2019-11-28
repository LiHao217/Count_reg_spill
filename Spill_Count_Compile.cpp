#include <fstream>  
#include <string>  
#include <cstring>
#include <iostream>  
#include <map>
#include "strip.h"
#include "Spill_Count.h"
#include "Output_Excel.h"
#include "Branch_Jump_Insn.h"
#include "Library_Function.h"


using namespace std;


int Spill_Count_Compile(string filepath,string Function_Output_Excel_path, string Loop_Output_Excel_path,bool Remove_Library_Function)
{
	ifstream in2(filepath);
	
	string Line;
	Basic_Black BB[Max_Basic_Black_Num];
	int Line_Num2 = 1;
	int Basic_Black_Num = 0;
	bool Count_Begin = false;
	if (in2)
	{
		while (getline(in2, Line))
		{
			Line_Num2++;
			int strline = Line.size();
			if (Line[0] == '.')
			{
				BB[Basic_Black_Num].Basic_Black_Name = rstrip(Line, ":");
				BB[Basic_Black_Num].Line_Num = Line_Num2;
				Basic_Black_Num++;
			}
		}
	}
	ifstream in(filepath);
	string File_Name;
	Line = "";
	string Spill_Symbol = "(%";
	string Label_Symbol = ".L";
	int Find_Function;
	int Line_Num = 1;
	int Function_Num = 0;
	int Loop_Num = 0;
	Function Function_List[Max_Fun_Num] = {0};
	Loop Loop_List[Max_Loop_Num];
	int Backwards_Jump[Max_Loop_Num][2]; //The first dimension represents the number of rows where the jump is, and the second dimension represents the number of rows where the jump is
	int Forward_Jump[Max_Loop_Num][2];//The first dimension represents the number of rows where the jump is, and the second dimension represents the number of rows where the jump is
	int Backwards_Jump_Num = 0;
	int Forward_Jump_Num = 0;
	int Function_List_size = 0;
	int Loop_List_size = 0;
	bool Find_New_Function = true;
	string Current_Basic_Block;
	//Basic_Black *BB;
	//BB = Find_Basic_Black(filepath);  	  
	if (in)
	{
		cout<< "File opened successfully" <<endl;
		while (getline(in, Line))
		{
			int Current_Function_Num = Function_Num;
			
			Line_Num += 1;
			int	begin = 0;

			int strline = Line.size();
			if (strline > 0)
			{
				Line = strip(Line, " ");//Delete any extra space before and after the line
				//Count register spill by Function
				//Find_Function = Line.find(Function_Symbol);
				if (Line[0] != '\t' && Line[0] != '.')
				{
					Find_New_Function = true;
					//int Function_Name_Begin = Line.find(Function_Name_Symbol);
					//string Line_temp = Line.substr(Function_Name_Begin + 1);
					string Current_Function_name = rstrip(Line, ":");
					//Determine if the function found is a system function
					if(Remove_Library_Function)
					{ 
						for (int i = 0; i < Library_Function_size; i++) {
							if (Library_Function[i] == Current_Function_name) {
								Find_New_Function = false;
							}
						}
					}
					
					if (Find_New_Function)
					{
						cout << "We find a Function:" << endl;
						cout << "The functiom number is :" << Current_Function_Num << endl;
						Function_List[Current_Function_Num].Begin = Line_Num;
						Function_List[Current_Function_Num].Name = Current_Function_name;
						cout << "Function name is :" << Function_List[Current_Function_Num].Name << endl;
						Function_Num += 1;
						Function_List_size++;
					}
					
				}
				int Spill_Begin = Line.find(Spill_Symbol);
				if (Spill_Begin > 0 && Current_Function_Num > 0)
				{
					Function_List[Current_Function_Num - 1].Split_Num += 1;
				}

				if (Current_Function_Num > 0)
				{
					Function_List[Current_Function_Num - 1].Line_Num += 1;
				}
				if (Line[0] == '.')
				{
					Current_Basic_Block = rstrip(Line, ":");
				}
				//Count register spill by loop
				if (Find_New_Function)
				{
					string Insn = strip(strip(strip(strip(Line.substr(1, 3), "\t"), "."), "L"), " ");//Gets the instruction for the current line
					for (int i = 0; i < Branch_Jump_Insn_size; i++)
					{
						//printf("%d", Branch_Jump_Insn->size());
						if (Branch_Jump_Insn[i] == Insn)
						{
							try
							{
								string Self_Line_Num_str = Current_Basic_Block;
								string Jump_Line_Num_str = "";
								int Jump_Label = Line.find(Label_Symbol);
								if (Jump_Label > 0)
								{
									Jump_Line_Num_str = rstrip(Line.substr(Jump_Label, 6), " ");
								}
								string Self_Line_Num_str_temp = lstrip(Current_Basic_Block, ".L");
								string Jump_Line_Num_str_temp = lstrip(Jump_Line_Num_str, ".L");
								int Self_Line_Num_int = Line_Num;
								int Jump_Line_Num_int =0;
								for (int i = 0; i < Max_Basic_Black_Num; i++)
								{
									if (BB[i].Basic_Black_Name == Jump_Line_Num_str)
									{
										Jump_Line_Num_int = BB[i].Line_Num;
									}
								}
								/*
								if(stoi(Self_Line_Num_str, nullptr, 16) > 0)
									Self_Line_Num_int = stoi(Self_Line_Num_str, nullptr, 16);
								if(Jump_Line_Num_str[0] != '*' && stoi(Jump_Line_Num_str, nullptr, 16) > 0){
									Jump_Line_Num_int = stoi(Jump_Line_Num_str, nullptr, 16);
								}										*/
								/*
								There is an instruction to jump to the previous code, but this does not prove that this is a return,
								because it does not prove that there is no other path to jump to this area
								*/ 
								if (Jump_Line_Num_int >0 && Jump_Line_Num_int < Self_Line_Num_int && Self_Line_Num_int>0)
								{
									cout << "We find a Forward jump:" << endl;
									int Current_Loop = Loop_Num;
									cout << "The Forward jump number is :" << Current_Loop << endl;
									Loop_List[Current_Loop].Fun_Name = Function_List[Current_Function_Num - 1].Name;
									Loop_List[Current_Loop].Begin = Jump_Line_Num_str;
									Loop_List[Current_Loop].End = Self_Line_Num_str;
									Loop_List[Current_Loop].Begin_int = Jump_Line_Num_int;
									Loop_List[Current_Loop].End_int = Self_Line_Num_int;
									Forward_Jump[Forward_Jump_Num][0] = Self_Line_Num_int;
									Forward_Jump[Forward_Jump_Num][1] = Jump_Line_Num_int;
									Forward_Jump_Num++;
									cout << "Start counting the spill information for this region" << endl;
									Loop_List[Current_Loop].Split_Num = Spill_Count_By_Line_Num(filepath, Jump_Line_Num_int, Self_Line_Num_int);
									Loop_List[Current_Loop].Loop_No = Loop_Num;
									cout << "The spill information of this region has been counted!" << endl;

									Loop_Num += 1;
									Loop_List_size++;
									//printf("2");
								}
								else if(Jump_Line_Num_int > 0  && Self_Line_Num_int>0)
								{
									//The jump is backwards
									Backwards_Jump[Backwards_Jump_Num][0] = Self_Line_Num_int;
									Backwards_Jump[Backwards_Jump_Num][1] = Jump_Line_Num_int;
									Backwards_Jump_Num++;
								}
							}
							catch (overflow_error e)
							{
							}
						}

					}
				}
				//cout << Line << endl;
			}
		}
		/*
		Remove nodes that are not return edges from the existing Loop List
		*/

		
		
		for (int j = 0; j < Loop_List_size; ++j)
		{
			bool Reduce_Loop_Num = false;
			for (int i = 0; i < Forward_Jump_Num; ++i)
			{
				if (Loop_List[j].End_int < Forward_Jump[i][0] && Loop_List[j].End_int > Forward_Jump[i][1] && Loop_List[j].Begin_int < Forward_Jump[i][1] )
				{
					if (Loop_List[j].Loop_No > 0)
					{
						cout << "Area " << Loop_List[j].Loop_No << " has other entries.There is a forward jump instruction into this area .It's not a loop" << endl;
						cout << "     The number of lines in this region is" << Loop_List[j].Begin_int << " to" << Loop_List[j].End_int << endl;
						cout << "     There are other jump commands, ranging from" << Forward_Jump[i][0] << " to" << Forward_Jump[i][1] << endl;

					}
					//This indicates that there are other entrances to the area, which is not a loop
					Loop_List[j].Loop_No = -1;
					Reduce_Loop_Num = true;
				}
			}
			for (int i = 0; i < Backwards_Jump_Num; ++i)
			{
				if (Loop_List[j].Begin_int > Backwards_Jump[i][0] && Loop_List[j].Begin_int < Backwards_Jump[i][1] && Loop_List[j].End_int > Backwards_Jump[i][1])
				{
					if (Loop_List[j].Loop_No > 0)
					{
						cout << "Area " << Loop_List[j].Loop_No << " has other entries.There is a backward jump instruction into this area. It's not a loop" << endl;
						cout << "     The number of lines in this region is" << Loop_List[j].Begin_int << " to" << Loop_List[j].End_int << endl;
						cout << "     There are other jump commands, ranging from" << Backwards_Jump[i][0] << " to" << Backwards_Jump[i][1] << endl;
					}						
					//This indicates that there are other entrances to the area, which is not a loop
					Loop_List[j].Loop_No = -1;
					Reduce_Loop_Num = true;

				}
			}
			if (Reduce_Loop_Num)
			{
				Loop_Num--;
			}
		}

		//Output statistical results
		cout << "The function number is "<< Function_Num << endl;
		cout << "The loop number is " << Loop_Num << endl;
		cout << "Register spill information has been calculated in units of functions" << endl;
		cout << "Register spill information has been calculated in units of loops" << endl;
		Function_Output_Excel(Function_Output_Excel_path, Function_List, Function_List_size);
		Loop_Output_Excel(Loop_Output_Excel_path, Loop_List, Loop_List_size);
	}
	else
	{
		cout << "no such file" << endl;
	}
	return 0;
}


int Spill_Count_By_Line_Num(string filepath,int Begin_Line_Num_int, int End_Line_Num_int)
{
	
	ifstream in2(filepath);
	string Line;
	string Spill_Symbol = "(%";
	int Line_Num = 1;
	int Split_Num = 0;
	bool Count_Begin = false;
	if (in2)
	{
		while (getline(in2, Line))
		{
			Line_Num++;
			int strline = Line.size();
			if (strline > 0) 
			{
				Line = strip(Line, " ");
				string Line_Num_str = Line.substr(0, 6);
				if (Line_Num == Begin_Line_Num_int)
				{
					Count_Begin = true;
				}
				if (Count_Begin)
				{
					int Spill_Begin = Line.find(Spill_Symbol);
					if (Spill_Begin > 0)
					{
						Split_Num += 1;
					}
				}
				if (Line_Num == End_Line_Num_int)
				{
					break;
				}
			}
		}
	}
	else
	{
		cout << "no such file" << endl;
	}
	return Split_Num;

}

/*
void Delete_Non_Return_Edges(Loop Loop_List[], int Loop_List_size)
{
	string Line;
	string Spill_Symbol = "(%";
	int Line_Num = 1;
	int Loop_Num = 0;
	int Split_Num = 0;
	bool Count_Begin = false;
}
*/
/*
Basic_Black *Find_Basic_Black(string filepath)
{
	Basic_Black BB[Max_Basic_Black_Num];
	ifstream in(filepath);
	string Line;
	int Line_Num = 1;
	int Basic_Black_Num = 0;
	bool Count_Begin = false;
	if (in)
	{
		while (getline(in, Line))
		{
			Line_Num++;
			int strline = Line.size();
			if (Line[0] == '.')
			{
				BB[Basic_Black_Num].Basic_Black_Name = rstrip(Line, ":");
				BB[Basic_Black_Num].Line_Num = Line_Num;
				Basic_Black_Num++;
			}
		}
	}
	else
	{
		cout << "no such file" << endl;
	}
	return BB;

}*/