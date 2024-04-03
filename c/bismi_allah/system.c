//in the name of Allah

#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("in the name of Allah\n");

    system("pwd");
    system("echo \"in the name of Allah\" > bismi_allah.txt");
    system("fc-list > /tmp/fc-list_scan_result");
    printf("result of command './bin/bismi_allah' = %d\n", system("./bin/bismi_allah"));
}

