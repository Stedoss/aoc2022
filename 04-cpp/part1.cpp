#include <fstream>
#include <iostream>

int impl();

int main()
{
    int result = impl();
    std::cout << result << std::endl;
    std::cout << (result == 584 ? "true" : "false") << std::endl;

    return 0;
}

int impl()
{
    std::ifstream file("input.txt");

    std::string line;

    int assignment_pair_count = 0;

    while (std::getline(file, line))
    {
        std::string first_col, second_col;

        first_col = line.substr(0, line.find(','));
        second_col = line.substr(line.find(',') + 1, line.length());

        int first_col_vals[2], second_col_vals[2];

        first_col_vals[0] = std::stoi(first_col.substr(0, first_col.find('-')));
        first_col_vals[1] = std::stoi(first_col.substr(first_col.find('-') + 1, first_col.length()));

        second_col_vals[0] = std::stoi(second_col.substr(0, second_col.find('-')));
        second_col_vals[1] = std::stoi(second_col.substr(second_col.find('-') + 1, second_col.length()));

        if (first_col_vals[0] <= second_col_vals[0] && first_col_vals[1] >= second_col_vals[1] ||
            first_col_vals[0] >= second_col_vals[0] && first_col_vals[1] <= second_col_vals[1])
            assignment_pair_count++;
    }

    return assignment_pair_count;
}

