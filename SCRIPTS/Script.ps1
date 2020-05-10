<#
    .SYNOPSIS 
        .AUTHOR %Author%
        .DATE   %Date%
        .VER    %Ver%
        .LANG   %Lang%   
    .DESCRIPTION
        %Description%
    .PARAMETER
    .EXAMPLE
        %Example%
#>
Param (
    
)
Clear-Host
$Global:ScriptName = $MyInvocation.MyCommand.Name
$InitScript        = "%InitScriptPath%"
if (. "$InitScript" -MyScriptRoot (Split-Path $PSCommandPath -Parent) -force ) { exit 1 }

# Error trap
trap {
    if ($Global:Logger) {
        Get-ErrorReporting $_
        %FinishScript% 
    }
    Else {
        Write-Host "There is error before logging initialized." -ForegroundColor Red
    }   
    exit 1
}
################################# Script start here #################################





################################# Script end here ###################################
%FinishScript%