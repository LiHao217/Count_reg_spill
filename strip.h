#include <string>  
#include <iostream>  

#define LEFTSTRIP 0
#define RIGHTSTRIP 1
#define BOTHSTRIP 2

std::string do_strip(const std::string& str, int striptype, const std::string& chars);


std::string strip(const std::string& str, const std::string& chars = " ");


std::string lstrip(const std::string& str, const std::string& chars = " ");


std::string rstrip(const std::string& str, const std::string& chars = " ");
