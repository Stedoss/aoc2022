#include <stdio.h>
#include <string.h>

#define ASCII_OFFSET 96
#define ASCII_OFFSET_CAP 64

int impl();

int main()
{
    int result = impl();
    printf("%d\n", result);
    printf("%s", result == 7691 ? "true" : "false");
}

int impl()
{
    FILE *file = fopen("input.txt", "r");;
    char line_buffer[256];

    int duplicated_item_points = 0;

    while (fgets(line_buffer, sizeof line_buffer, file))
    {
        int line_length = (int)strlen(line_buffer);
        int line_mid = line_length / 2;

        char first_split[line_mid + 1];
        char second_split[line_mid + 1];

        // split, there's probably a better way to split here
        for (int i = 0; i < line_length; i++)
        {
            if (i < line_mid)
                first_split[i] = line_buffer[i];
            else
                second_split[i - line_mid] = line_buffer[i];
        }

        first_split[line_mid] = '\0';
        second_split[line_mid] = '\0';

        for (int i = 0; i < line_mid; i++)
        {
            char currentChar = first_split[i];
            const char* charPosition = strchr(second_split, currentChar);

            if (charPosition) {
                if (currentChar > 96)
                    duplicated_item_points += currentChar - ASCII_OFFSET;
                else
                    duplicated_item_points += currentChar - ASCII_OFFSET_CAP + 26;

                for (int j = 0; j < line_mid; j++)
                    if (currentChar == first_split[j])
                        first_split[j] = ' ';
            }
        }
    }

    fclose(file);

    return duplicated_item_points;
}