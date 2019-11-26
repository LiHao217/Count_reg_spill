#pragma once
#include<string>
using namespace std;

#define Library_Function_size 37

string Library_Function[Library_Function_size] = { "_init","printf@plt-0x10","printf@plt",	
													"__libc_start_main@plt","__gmon_start__@plt","deregister_tm_clones",	
													"register_tm_clones","__do_global_dtors_aux","frame_dummy",	
													"__libc_csu_init","__libc_csu_fini>","_fini",
													"_start","__libc_csu_fini",".plt",
													"realloc@plt","putchar@plt","strcpy@plt",
													"puts@plt","calloc@plt","free@plt",
													"fclose@plt","printf@plt","__libc_start_main@plt",
													"fgets@plt","fprintf@plt","__gmon_start__@plt",
													"strtol@plt","fflush@plt","__isoc99_sscanf@plt",
													"fopen@plt","sprintf@plt","exit@plt",
													"fwrite@plt","malloc@plt","__libc_csu_init",
													"__libc_csu_fini"};
