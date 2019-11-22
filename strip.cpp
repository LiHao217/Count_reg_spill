/*
	result = strip(str);


	//Specify delete sequence
	result = strip(str, "gf");
	str = "abcdefg";
	string chars = "abfg";

	//Delete only the left
	result = lstrip(str, chars);


	//Delete only the right
	result = rstrip(str, chars);

*/


#include <string>  
#include <iostream>  
#include "strip.h"
std::string strip(const std::string& str, const std::string& chars)
{
	return do_strip(str, BOTHSTRIP, chars);
}

std::string lstrip(const std::string& str, const std::string& chars)
{
	return do_strip(str, LEFTSTRIP, chars);
}

std::string rstrip(const std::string& str, const std::string& chars)
{
	return do_strip(str, RIGHTSTRIP, chars);
}

std::string do_strip(const std::string& str, int striptype, const std::string& chars)
{
	std::string::size_type strlen = str.size();
	std::string::size_type charslen = chars.size();
	std::string::size_type i, j;

	//By default, whitespace characters are removed
	if (0 == charslen)
	{
		i = 0;
		//Remove the left margin character
		if (striptype != RIGHTSTRIP)
		{
			while (i < strlen && ::isspace(str[i]))
			{
				i++;
			}
		}
		j = strlen;
		//Remove the right margin character
		if (striptype != LEFTSTRIP)
		{
			j--;
			while (j >= i && ::isspace(str[j]))
			{
				j--;
			}
			j++;
		}
	}
	else
	{
		//Converts the delete sequence to a c string
		const char* sep = chars.c_str();
		i = 0;
		if (striptype != RIGHTSTRIP)
		{
			//Memchr function: find STR [I] from the previous charslen bytes of the memory area that sep points to
			while (i < strlen && memchr(sep, str[i], charslen))
			{
				i++;
			}
		}
		j = strlen;
		if (striptype != LEFTSTRIP)
		{
			j--;
			while (j >= i && memchr(sep, str[j], charslen))
			{
				j--;
			}
			j++;
		}
		//If no characters need to be deleted
		if (0 == i && j == strlen)
		{
			return str;
		}
		else
		{
			return str.substr(i, j - i);
		}
	}

}

