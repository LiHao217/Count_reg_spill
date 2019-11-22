#pragma once
#include <iostream>
#include <fstream>
#include <string>
#include "Spill_Count.h"
using namespace std;
int Function_Output_Excel(string filepath, Function Function_List[], int Function_List_size);
int Loop_Output_Excel(string filepath, Loop Loop_List[], int Loop_List_size);