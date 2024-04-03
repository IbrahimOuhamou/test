//in the name of Allah

#include <stdio.h>
#include <stdlib.h>

struct bismi_allah_node_t
{
    struct bismi_allah_node_t *prev;
    struct bismi_allah_node_t *next;
    char message[50];
    int bismi_allah_id;
};

int bismi_allah_node_new(char *message, int bismi_allah_id);

int main()
{
    printf("in the name of Allah\n");

    int *arr = (int*)malloc(sizeof(int) * 12);
    for(int i = 0; i < 12; i++)
    {
        arr[i] = i;
    }

    for(int *num = &arr[0]; num != &arr[11]; num++)
    {
        printf("%d\n", *num);
    }
}

