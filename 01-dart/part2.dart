import "dart:io";

void main() {
    final result = impl();
    print(result);
    print(result == 210957);
}

int impl() {
    final fileLines = File("input.txt").readAsLinesSync();

    // If the file doesn't have a new line at the end, make one
    if (fileLines.last.isEmpty) {
        fileLines.add("");
    }

    final elfCalories = <int>[];

    int currentElfCal = 0;

    for (var line in fileLines) {
        if (line.isEmpty) {
            elfCalories.add(currentElfCal);

            currentElfCal = 0;
            continue;
        } else {
            currentElfCal += int.parse(line);
        }
    }

    elfCalories.sort(((a, b) => b - a));

    final topThreeCalories = elfCalories.take(3).reduce((a, b) => a + b);

    return topThreeCalories;
}