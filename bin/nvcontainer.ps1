$serviceName = "NVDisplay.ContainerLocalSystem"

$service = Get-Service -Name $serviceName

if ($service) {
    Set-Service -Name $serviceName -StartupType Manual
    Write-Host "Startup type of service '$serviceName' set to Manual"
} else {
    Write-Host "Service '$serviceName' not found."
}

$serviceName = "NVDisplay.ContainerLocalSystem" 

Start-Service -Name $serviceName
Start-Sleep -Seconds 2
$processName = "NVDisplay.Container.exe"
Get-Process -Name $processName

if (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
    Stop-Process -Name $processName -Force
    Write-Host "Process '$processName' stopped."
} else {
    Start-Process -FilePath "C:\Windows\System32\DriverStore\FileRepository\nv_dispig.inf_amd64_2fe7c165c5dd3267\Display.NvContainer\NVDisplay.Container.exe"
    Write-Host "Process '$processName' started."
}
Start-Sleep -Seconds 3

Stop-Process -Name $processName -Force
Write-Host "Process '$processName' stopped."

Start-Process -FilePath $executablePath
Start-Sleep -Seconds 5

Get-Process -Name "NVDisplay.Container.exe" | Stop-Process -Force
Start-Sleep -Seconds 3
Stop-Service -Name $serviceName

Set-Service -Name $serviceName -StartupType Disabled
exit


