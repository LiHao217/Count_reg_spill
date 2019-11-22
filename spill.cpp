#include <fstream>  
#include <string>  
#include <iostream>  
#include "strip.h"
#include "Spill_Count.h"
using namespace std;


int main()
{
	string filepath = "lbm.txt";
	Spill_Count(filepath);
	return 0;
}
