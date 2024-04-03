//in the name of Allah

#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("in the name of Allah\n");
    printf("SEEK_END == %d\n", SEEK_END);
    system("fc-list > /tmp/fc-list_scan");
    FILE *f = fopen("/tmp/fc-list_scan", "r");
    fseek(f, 0, SEEK_END);
    int size = ftell(f);
    rewind(f);
    char *buffer = malloc(size);
    char **font_path_array;
    int line_count = 0;

    {
        int current_line = 1;
        char c;

        for(int i = 0; EOF != (c = fgetc(f)); i++)
        {
            buffer[i] = c;
            if('\n' == c) line_count+=1;
        }
        rewind(f);
        
        font_path_array = malloc(line_count * sizeof(char*));

        font_path_array[0] = buffer;
        for(int i = 0; EOF != (c = fgetc(f)); i++)
        {
            if('\n' == c)
            {
                font_path_array[current_line] = (char*)(buffer + i + 1);
                current_line += 1;
            }
            else if(':' == c)
            {
                buffer[i] = '\0';
            }
        }
        printf("line_count == %d\n", line_count);
    }

    for(int i = 0; i < line_count; i++)
    {
        printf("[%d] %s\n", i+1, font_path_array[i]);
    }
    fclose(f);
}

