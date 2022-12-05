import std/strutils

const LANES = 9

let
    file = readFile("input.txt")
    fileLines = splitLines(file)

var indexLine = 0
for line in fileLines:
    if line.startsWith(" 1"):
        break
    indexLine += 1

var
    cargo: array[LANES, seq[char]]
    cargoIndex = 0
    verticalIndex = 1

for i in 0..fileLines[indexLine].len - 1:
    for j in countdown(indexLine-1, 0):
        if (fileLines[j].len > verticalIndex):
            if fileLines[j][verticalIndex] != ' ':
                cargo[cargoIndex].add(fileLines[j][verticalIndex])
    verticalIndex += 4
    if verticalIndex > fileLines[indexLine].len:
        break
    cargoIndex += 1

for line in fileLines:
    if not line.startsWith("move"):
        continue

    let
        instructionLine = line.split(" ")
        moveCount = parseInt(instructionLine[1])
        origin = parseInt(instructionLine[3]) - 1
        destination = parseInt(instructionLine[5]) - 1

    for _ in 1..moveCount:
        let val = cargo[origin].pop()
        cargo[destination].add(val)

# print results
for i, c in cargo:
    echo c

for c in cargo:
    echo c[^1]