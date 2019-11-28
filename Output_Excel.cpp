#include <iostream>
#include <fstream>
#include <string>
#include "Spill_Count.h"
using namespace std;
int Function_Output_Excel(string filepath,Function Function_List[],int Function_List_size)
{
	ofstream oFile;
	oFile.open(filepath, ios::out | ios::trunc);
	cout << "The statistics file was created successfully" << endl;
	oFile << "Functio_Name" << "," << "Functio_Line_Num" << "," << "Bengin" << "," << "Spill_Num" << "," << "End" << endl;
	for (int i = 0; i < Function_List_size; i++)
	{
		oFile << Function_List[i].Name << "," << Function_List[i].Line_Num << "," << Function_List[i].Begin << "," << Function_List[i].Split_Num << "," << Function_List[i].Begin + Function_List[i].Line_Num <<endl;
	}
	oFile.close();

	cout << "Spill_by_Fun Output_Excel sucess!" << endl;
	return 0;
}

int Loop_Output_Excel(string filepath, Loop Loop_List[], int Loop_List_size)
{
	ofstream oFile;
	oFile.open(filepath, ios::out | ios::trunc);
	cout << "The statistics file was created successfully" << endl;
	oFile << "Functio_Name" << "," << "Loop" << "," << "Bengin_BB"  << "," << "End_BB" << "," << "Bengin_Line"  << "," << "End_Line" << "," << "Spill_Num" << endl;
	for (int i = 0; i < Loop_List_size; i++)
	{
		if (Loop_List[i].Loop_No >= 0)
		{
			oFile << Loop_List[i].Fun_Name << "," << Loop_List[i].Loop_No << "," << Loop_List[i].Begin << "," << Loop_List[i].End <<  "," << Loop_List[i].Begin_int << "," << Loop_List[i].End_int << "," << Loop_List[i].Split_Num  << endl;
	
		}
	}
	oFile.close();

	cout << "Spill_by_Loop Output_Excel sucess!" << endl;
	return 0;
}