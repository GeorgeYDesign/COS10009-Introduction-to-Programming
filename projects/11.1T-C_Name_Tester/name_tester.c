#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

#define LOOP_COUNT 60

void silly_name(char* name)
{
    printf("%s\n", name);
    for(int i=0; i<60; i++)
    {
        printf("silly ");
    }
    printf("name");
}

int main()
{
    printf("Please enter your name ");
    char name[255];
    scanf("%s", &name);
    printf("%s\n", name);

    if(strcasecmp("George", name)==0)
    {
        printf("%s is an awesome name", name);
    }
    else
    {
        silly_name(name);
    }
     return 0;
}
