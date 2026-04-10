<#
.SYNOPSIS
    Gera relatório de espaço em disco em servidores.
.DESCRIPTION
    Verifica todos os discos fixos e gera um alerta caso o espaço esteja abaixo de 10%.
.EXAMPLE
    .\Get-DiskSpaceReport.ps1
#>

$Threshold = 10 # Porcentagem de alerta
$ReportPath = "$PSScriptRoot\DiskReport.txt"

$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

foreach ($Disk in $Disks) {
    $FreeSpaceGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
    $SizeGB = [Math]::Round($Disk.Size / 1GB, 2)
    $PercentFree = [Math]::Round(($Disk.FreeSpace / $Disk.Size) * 100, 2)

    $Status = if ($PercentFree -lt $Threshold) { "CRITICO" } else { "SAUDAVEL" }

    $Result = "Disco $($Disk.DeviceID) | Total: $SizeGB GB | Livre: $FreeSpaceGB GB ($PercentFree%) | Status: $Status"
    
    Write-Output $Result
    $Result | Out-File -FilePath $ReportPath -Append
}