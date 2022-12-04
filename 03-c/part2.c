#include <stdio.h>
#include <string.h>

#define ASCII_OFFSET 96
#define ASCII_OFFSET_CAP 64

int impl();

int main()
{
    int result = impl();
    printf("%d\n", result);
    printf("%s", result == 2508 ? "true" : "false");
}

int impl()
{
    FILE *file = fopen("input.txt", "r");
    char line_buffer[256];
    char working_lines[3][256];

    int current_group = 0;
    int medal_points = 0;

    while (fgets(line_buffer, sizeof line_buffer, file))
    {
        strcpy(working_lines[current_group], line_buffer);
        current_group++;

        if (current_group % 3 == 0)
        {
            for (int i = 0; working_lines[0][i] != '\0'; i++)
            {
                char current_char = working_lines[0][i];

                if (strchr(working_lines[1], current_char) &&
                    strchr(working_lines[2], current_char))
                {
                    if (current_char > 96)
                        medal_points += current_char - ASCII_OFFSET;
                    else
                        medal_points += current_char - ASCII_OFFSET_CAP + 26;

                    break;
                }
            }

            current_group = 0;
        }
    }

    fclose(file);

    return medal_points;
}