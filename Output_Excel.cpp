#include <iostream>
#include <fstream>
#include <string>
#include "Spill_Count.h"
using namespace std;
int Function_Output_Excel(string filepath,Function Function_List[],int Function_List_size)
{
	ofstream oFile;
	oFile.open(filepath, ios::out | ios::trunc);
	oFile << "Functio_Name" << "," << "Functio_Line_Num" << "," << "Bengin" << "," << "Split_Num" << "," << "End" << endl;
	for (int i = 0; i < Function_List_size; i++)
	{
		oFile << Function_List[i].Name << "," << Function_List[i].Line_Num << "," << Function_List[i].Begin << "," << Function_List[i].Split_Num << "," << Function_List[i].Begin + Function_List[i].Line_Num <<endl;
	}
	oFile.close();
	printf("Spill_by_Fun Output_Excel sucess!");
	return 0;
}

int Loop_Output_Excel(string filepath, Loop Loop_List[], int Loop_List_size)
{
	ofstream oFile;
	oFile.open(filepath, ios::out | ios::trunc);
	oFile << "Functio_Name" << "," << "Loop" << "," << "Bengin"  << "," << "End" << "," << "Split_Num" << endl;
	for (int i = 0; i < Loop_List_size; i++)
	{
		oFile << Loop_List[i].Fun_Name << "," << Loop_List[i].Loop_No<< "," << Loop_List[i].Begin << "," << Loop_List[i].End << "," << Loop_List[i].Split_Num  << endl;
	}
	oFile.close();
	printf("Spill_by_Loop Output_Excel sucess!");
	return 0;
}