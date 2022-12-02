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
    outcome: char;
    totalPoints: integer;
    i: integer;

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
        outcome := currentLine[3];

        if outcome = 'Y' then //draw
        begin
            totalPoints += 3;
            totalPoints += shapePointValues[chr(ord(opponentChoice)+23)];
        end
        else if outcome = 'Z' then //win
        begin
            totalPoints += 6;
            totalPoints += shapePointValues[winResults[opponentChoice]];
        end
        else
        begin
            for i := 0 to winResults.Count - 1 do
            begin
                if winResults.Data[i] = chr(ord(opponentChoice)+23) then
                begin
                    totalPoints += shapePointValues[chr(ord(winResults.Keys[i])+23)];
                end;
            end;
        end;
    until (eof(inputFile));

    Close(inputFile);

    impl := totalPoints;
end;

begin
    ret := impl;
    WriteLn(ret);
    WriteLn(ret = 12429);
end.