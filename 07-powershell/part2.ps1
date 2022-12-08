# Obviously I would usually use a tree here, but this was easier and more "fun"!

$dirList = @{}
$currentDir = ""
$currentDirSize = 0

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

$dirListTotalSizes = @{}

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

    $dirListTotalSizes[$dir.Name] = $dirSize
}

$deletedSpaceRequired = ((70000000 - $dirListTotalSizes["//"]) - 30000000) * -1
$dirSmallestValidDir = 99999999999;

foreach ($dir in $dirListTotalSizes.GetEnumerator())
{
    if ((($deletedSpaceRequired - $dir.Value) -lt 1) -and ($dir.Value -lt $dirSmallestValidDir))
    {
        $dirSmallestValidDir = $dir.Value
    }
}

Write-Output $dirSmallestValidDir