<#
    .NOTE
        .AUTHOR %Author%
        .DATE   %Date%
        .VER    %Ver%
        .LANG   %Lang%
        
    .LINK
        %ProjectURL%
    
    .COMPONENT
        %Component%

    .SYNOPSIS 

    .DESCRIPTION
        %Description% 

    .PARAMETER

    .EXAMPLE
        %Example%

#>
Param (
    
)
Clear-Host
$Global:ScriptInvocation = $MyInvocation
$InitScript        = "%InitScriptPath%"
. "$InitScript" -MyScriptRoot (Split-Path $PSCommandPath -Parent)
if ($LastExitCode) { exit 1 }

# Error trap
trap {
    if ($Global:Logger) {
        Get-ErrorReporting $_
        %FinishScript% 
    }
    Else {
        Write-Host "[$($MyInvocation.MyCommand.path)] There is error before logging initialized." -ForegroundColor Red
    }   
    exit 1
}
################################# Script start here #################################





################################# Script end here ###################################
%FinishScript%