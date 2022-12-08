<?php

$data = file("./input.txt");

$visibleCount = 0;

for ($x = 1; $x < strlen($data[0]) - 3; $x++) {
    for ($y = 1; $y < sizeof($data) - 1; $y++) {
        $leftVisible = true;
        for ($xCheck = 0; $xCheck < $x; $xCheck++) {
            if ($data[$y][$xCheck] >= $data[$y][$x]) {
                $leftVisible = false;
            }
        }

        $rightVisible = true;
        for ($xCheck = $x + 1; $xCheck < strlen($data[0]) - 2; $xCheck++) {
            if ($data[$y][$xCheck] >= $data[$y][$x]) {
                $rightVisible = false;
            }
        }

        $topVisible = true;
        for ($yCheck = 0; $yCheck < $y; $yCheck++) {
            if ($data[$yCheck][$x] >= $data[$y][$x]) {
                $topVisible = false;
            }
        }

        $bottomVisible = true;
        for ($yCheck = $y + 1; $yCheck < sizeof($data); $yCheck++) {
            if ($data[$yCheck][$x] >= $data[$y][$x]){
                $bottomVisible = false;
            }
        }

        if ($leftVisible || $rightVisible || $topVisible || $bottomVisible) {
            $visibleCount++;
        }
    }
}

$edgeCount = ((strlen($data[0]) - 2) * 2) + ((sizeof($data) - 2) * 2);

echo $visibleCount + $edgeCount;