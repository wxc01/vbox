
function fStartProcess([string]$sProcess,[string]$sArgs,[ref]$pOutPut)
{
    $oProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $oProcessInfo.FileName = $sProcess
    $oProcessInfo.RedirectStandardError = $true
    $oProcessInfo.RedirectStandardOutput = $true
    $oProcessInfo.UseShellExecute = $false
    $oProcessInfo.Arguments = $sArgs
    $oProcess = New-Object System.Diagnostics.Process
    $oProcess.StartInfo = $oProcessInfo
    [Void] $oProcess.Start() 
    [Void] $oProcess.WaitForExit() 
    $sSTDOUT = $oProcess.StandardOutput.ReadToEnd()
    $sSTDERR = $oProcess.StandardError.ReadToEnd()
    $pOutPut.Value="Commandline: $sProcess $sArgs`r`n"
    $pOutPut.Value+="STDOUT: " + $sSTDOUT + "`r`n"
    $pOutPut.Value+="STDERR: " + $sSTDERR + "`r`n"
    return $oProcess.ExitCode
}

function fStartProcessLine([string]$sProcess,[string]$sArgs,[ref]$pOutPut)
{
   $oProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $oProcessInfo.FileName = $sProcess
    $oProcessInfo.RedirectStandardError = $true
    $oProcessInfo.RedirectStandardOutput = $true
    $oProcessInfo.UseShellExecute = $false
    $oProcessInfo.Arguments = $sArgs
    $oProcess = New-Object System.Diagnostics.Process
    $oProcess.StartInfo = $oProcessInfo
    [Void] $oProcess.Start() 
    $sSTDOUT = $oProcess.StandardOutput.ReadLine()
    $pOutPut.Value+="STDOUT: " + $sSTDOUT + "`r`n"
    return $oProcess.ExitCode



}

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

while(!$portlisten) {
    Write-Output "Port not yet up...sleeping 10 sec"
    Start-Sleep -s 10
}

if($portlisten -like "Listen"){

    $connected = $false
    while(!$connected){
        $connected = Test-NetConnection -ComputerName 127.0.0.1 -Port 2122 |Select-Object -ExpandProperty TcpTestSucceeded

    }

    if($connected){
        $testplink=$false



            }while(!$testplink)
            {
                    Write-Output "testing via plink!" 
                    $o=""
                    fStartProcessLine plink.exe "-raw -load alpineprogwC" ([ref]$o)
                    if ($o.Contains("SSH")){
                        $testplink=$true
                    }
            }
            
                putty -load alpineprogwC

    }


