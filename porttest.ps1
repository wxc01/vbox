$psi = New-object System.Diagnostics.ProcessStartInfo 
$psi.CreateNoWindow = $true 
$psi.UseShellExecute = $false 
$psi.RedirectStandardOutput = $true 
$psi.RedirectStandardError = $true
$psi.FileName = 'C:\Oracle\VirtualBox\VBoxManage.exe'
$psi.Arguments = @("showvminfo", "alpine3115virt_cprogramming")
$process = New-Object System.Diagnostics.Process 
$process.StartInfo = $psi 
[void]$process.Start()
$output = $process.StandardOutput.ReadToEnd() 
$process.WaitForExit() 


if(!$output.ToString().Contains("running")){
    C:\Oracle\VirtualBox\VBoxManage.exe startvm "alpine3115virt_cprogramming" --type headless
 }
$portlisten = Get-NetTCPConnection -LocalAddress 0.0.0.0 -LocalPort 2122 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty State
$portlisten 
while(!$portlisten) {
    Write-Output "Port not yet up...sleeping 10 sec"
    Start-Sleep -s 10
}

if($portlisten -like "Listen"){

    $connected = $false
    while(!$connected){
        $connected = Test-NetConnection -ComputerName 127.0.0.1 -Port 2122 |Select-Object -ExpandProperty TcpTestSucceeded
        Write-Output "Can connect to port!" $connected 

    }

    if($connected){
        Write-Output "Starting putty..."
        putty -load "alpineprogwC"

    }
}
