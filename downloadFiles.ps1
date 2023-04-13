# Set-ExecutionPolicy RemoteSigned    # optional
# Add-Type -AssemblyName System.Web   # optional

Param(
    [Parameter(Mandatory=$true)]
    [string]$downloadList,            # example:  .\list.txt    (one file per each line)

    [Parameter(Mandatory=$true)]
    [string]$webSite                  # example: "https://archive.org/download/dreamcast.-cdi.-roms.-pack-vlc/"
)

Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "Start"

$downloadFolder = '.\downloadedFiles\'

if (!(Test-Path -LiteralPath $downloadFolder))
{
    Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "Creating folder" $downloadFolder
    New-Item -Path $downloadFolder -ItemType Directory | Out-Null
}

$counter = 0

foreach ($file in Get-Content $downloadList)
{
    if (Test-Path -LiteralPath ($downloadFolder+$file))
    {
        Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "File already exists" $file
        continue;
    }

    Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "Downloading" $file
        
    $uri = $webSite + ([uri]::EscapeDataString($file))
    $outFile = $downloadFolder + "tempFile"
    
    try
    {
        Invoke-WebRequest -Uri $uri -OutFile $outFile
        Rename-Item $outFile -NewName $file
    }
    catch
    {
        Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "ERROR" $_.Exception
    }

    $counter++
}

Write-Host (Get-Date -Format "yyyy-MM-dd HH:mm:ss") "End"
Write-Host $counter "files downloaded"
