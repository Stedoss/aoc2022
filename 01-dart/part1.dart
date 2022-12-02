import "dart:io";

void main(List<String> args) {
    final result = impl();
    print(result);
    print(result == 72240);
}

int impl() {
    final fileLines = File("input.txt").readAsLinesSync();

    // If the file doesn't have a new line at the end, make one
    if (fileLines.last.isEmpty) {
        fileLines.add("");
    }

    int fattestElf = 0, fattestElfCal = 0;
    int currentElf = 1;
    int currentElfCal = 0;

    for (var line in fileLines) {
        if (line.isEmpty) {
            if (currentElfCal > fattestElfCal) {
                fattestElfCal = currentElfCal;
                fattestElf = currentElf;
            }

            currentElfCal = 0;
            currentElf++;
        } else {
            currentElfCal += int.parse(line);
        }
    }

    return fattestElfCal;
}