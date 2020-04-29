$MyScriptRoot = "C:\Users\Alex\Documents\PROJECTS\VMUtils\SCRIPTS"
$GlobalInitScript = "$(split-path -path (Split-Path -path $MyScriptRoot -Parent) -parent)\GlobalSettings\SCRIPTS\Init.ps1"

. "$GlobalInitScript" -MyScriptRoot $MyScriptRoot
# Error trap
trap {
    if ($Global:Logger) {
        Get-ErrorReporting $_ 
    }
    Else {
        Write-Host "There is error before logging initialized." -ForegroundColor Red
    }   
    exit 1
}
Clear-Host