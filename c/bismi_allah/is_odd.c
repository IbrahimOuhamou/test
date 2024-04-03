//in the name of Allah

#include <stdio.h>
#include <stdint.h>

uint8_t is_odd(int n);

int main()
{
    printf("bismi Allah\n");
    for(int i =0; i < 10; i++)
    {
        if(is_odd(i))
        {
            printf("%d & 1 == true\n", i);
        }
    }
}

uint8_t is_odd(int n)
{
    return !(n & 1);
}

