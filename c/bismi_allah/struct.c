//in the name of Allah
//la ilaha illa Allah mohammed rassoul Allah

#include <stdio.h>

int main()
{
    printf("in the name of Allah\n");

    struct {int a; int b;} bismi_allah_arr[] = 
    { 
        {1, 7},
        {2, 6},
        {3, 5},
        {4, 4},
        {5, 3},
        {6, 2},
        {7, 1},
        {0, 0}
    };

    for(int i = 0; bismi_allah_arr[i].a!=0 && bismi_allah_arr[i].b!=0; i++)
    {
        printf("bismi_allah_arr[%d].a == %d\n", i, bismi_allah_arr[i].a);
    }
    for(int i = 0; bismi_allah_arr[i].a!=0 && bismi_allah_arr[i].b!=0; i++)
    {
        printf("bismi_allah_arr[%d].b == %d\n", i, bismi_allah_arr[i].b);
    }

    printf("bismi_allah_arr[0].a == %d\n", bismi_allah_arr[0].a);
    printf("bismi_allah_arr[0].b == %d\n", bismi_allah_arr[0].b);
    printf("bismi_allah_arr[1].a == %d\n", bismi_allah_arr[1].a);
    printf("bismi_allah_arr[1].b == %d\n", bismi_allah_arr[1].b);
}

