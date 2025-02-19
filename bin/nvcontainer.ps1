$ServiceName = "NVDisplay.ContainerLocalSystem" 
$service = Get-Service -Name $ServiceName
$serviceStatus = $service.Status

if ($serviceStatus -ne "Running") {
    Stop-Service -Name $ServiceName -Force
    Set-Service -Name $ServiceName -StartupType Disabled
 }
 
Set-Service -Name $ServiceName -StartupType Manual

Start-Service -Name $ServiceName
    
Start-Sleep -Seconds 5

Stop-Service -Name $ServiceName

Set-Service -Name $ServiceName -StartupType Disabled

exit