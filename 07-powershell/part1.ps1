# Obviously I would usually use a tree here, but this was easier and more "fun"!

$dirList = @{}
$currentDir = ""
$currentDirSize = 0
$dirListTotalSizes = @{}

foreach ($line in Get-Content ./input.txt)
{
    if ($line.StartsWith("$ cd"))
    {
        if (-Not $dirList.ContainsKey($currentDir))
        {
            $dirList[$currentDir] = $currentDirSize
            $currentDirSize = 0
        }

        $split = $line.Split(" ")
        $dirTarget = $split[2]
        if ($dirTarget -eq "..")
        {
            $currentDir = $currentDir.Substring(0, $currentDir.TrimEnd("/").LastIndexOf("/")) + "/"
        }
        else
        {
            $currentDir += $split[2] + "/"
        }
    }
    elseif(-Not $line.StartsWith("$"))
    {
        if (-Not $line.StartsWith("dir"))
        {
            $currentDirSize += [int]$line.Split(" ")[0]
        }
    }
}

$dirList[$currentDir] = $currentDirSize

$totalLessThanLimit = 0

foreach ($dir in $dirList.GetEnumerator())
{
    $dirSize = 0
    foreach ($subDir in $dirList.GetEnumerator())
    {
        if ($subDir.Name.StartsWith($dir.Name))
        {
            $dirSize += $subDir.Value
        }
    }

    if ($dirSize -lt 100000)
    {
        $dirListTotalSizes[$dir.Name] = $dirSize
        $totalLessThanLimit += $dirSize
    }
}

Write-Output $totalLessThanLimit