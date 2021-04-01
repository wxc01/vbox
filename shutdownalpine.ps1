$psi = New-object System.Diagnostics.ProcessStartInfo 
$psi.CreateNoWindow = $true 
$psi.UseShellExecute = $false 
$psi.RedirectStandardOutput = $true 
$psi.RedirectStandardError = $true
$psi.FileName = 'C:\Oracle\VirtualBox\VBoxManage.exe'
$psi.Arguments = @("controlvm", "alpine3115virt_cprogramming", "poweroff")
$process = New-Object System.Diagnostics.Process 
$process.StartInfo = $psi 
[void]$process.Start()
$output = $process.StandardOutput.ReadToEnd() 
$process.WaitForExit() 
