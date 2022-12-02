uses
    fgl;

type
    TCharIntMap = specialize TFPGMap<char, Integer>;
    TCharCharMap = specialize TFPGMap<char, char>;

var
    ret: integer;

function impl(): integer;
var
    inputFile: TextFile;
    shapePointValues: TCharIntMap;
    winResults: TCharCharMap;
    currentLine: string;
    opponentChoice: char;
    guidedChoice: char;
    totalPoints: integer;

begin
    shapePointValues := TCharIntMap.Create;
    shapePointValues['X'] := 1;
    shapePointValues['Y'] := 2;
    shapePointValues['Z'] := 3;

    winResults := TCharCharMap.Create;
    winResults['A'] := 'Y';
    winResults['B'] := 'Z';
    winResults['C'] := 'X';

    totalPoints := 0;

    Assign(inputFile, 'input.txt');
    reset(inputFile);

    repeat
        readln(inputFile, currentLine);

        opponentChoice := currentLine[1];
        guidedChoice := currentLine[3];

        totalPoints += shapePointValues[guidedChoice];

        if opponentChoice = chr(ord(guidedChoice)-23) then
            totalPoints += 3
        else if winResults[opponentChoice] = guidedChoice then
            totalPoints += 6
    until (eof(inputFile) or (currentLine = ''));

    Close(inputFile);

    impl := totalPoints;
end;

begin
    ret := impl;
    WriteLn(ret);
    WriteLn(ret = 9759);
end.