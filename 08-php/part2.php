<?php

$data = file("./input.txt");

$maxViewDistance = 0;

for ($x = 0; $x < strlen($data[0]) - 2; $x++) {
    for ($y = 0; $y < sizeof($data); $y++) {
        $leftTreeCount = 0;
        for ($xCheck = $x - 1; $xCheck >= 0; $xCheck--) {
            $leftTreeCount++;
            if ($data[$y][$xCheck] >= $data[$y][$x]) {
                break;
            }
        }

        $rightTreeCount = 0;
        for ($xCheck = $x + 1; $xCheck < strlen($data[0]) - 2; $xCheck++) {
            $rightTreeCount++;
            if ($data[$y][$xCheck] >= $data[$y][$x]) {
                break;
            }
        }

        $topTreeCount = 0;
        for ($yCheck = $y - 1; $yCheck >= 0; $yCheck--) {
            $topTreeCount++;
            if ($data[$yCheck][$x] >= $data[$y][$x]) {
                break;
            }
        }

        $bottomTreeCount = 0;
        for ($yCheck = $y + 1; $yCheck < sizeof($data); $yCheck++) {
            $bottomTreeCount++;
            if ($data[$yCheck][$x] >= $data[$y][$x]) {
                break;
            }
        }

        $viewDistance = $bottomTreeCount * $topTreeCount * $rightTreeCount * $leftTreeCount;

        if ($viewDistance > $maxViewDistance) {
            $maxViewDistance = $viewDistance;
        }
    }
}

echo $maxViewDistance;