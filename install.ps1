#create firewall rule
New-NetFirewallRule -DisplayName "Skillable Labs VM Integration Service" -Direction Inbound -Action Allow -LocalPort 2724 -Protocol TCP

#create startup task
$action = New-ScheduledTaskAction -Execute "C:\VmIntegrationService\Skillable.Labs.VmIntegrationService.exe" -WorkingDirectory "C:\VmIntegrationService"
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask -TaskName "Start Skillable Labs VM Integration Service" -InputObject $task
