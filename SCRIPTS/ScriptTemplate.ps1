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
    [Parameter( Mandatory = $false, Position = 0, HelpMessage = "Initialize global settings." )]
    [bool] $InitGlobal = $true,
    [Parameter( Mandatory = $false, Position = 1, HelpMessage = "Initialize local settings." )]
    [bool] $InitLocal  = $true   
)

$Global:ScriptInvocation = $MyInvocation
if ($env:AlexKFrameworkInitScript){
    . "$env:AlexKFrameworkInitScript" -MyScriptRoot (Split-Path $PSCommandPath -Parent) -InitGlobal $InitGlobal -InitLocal $InitLocal
} Else {
    Write-host "Environmental variable [AlexKFrameworkInitScript] does not exist!" -ForegroundColor Red
     exit 1
}
if ($LastExitCode) { exit 1 }

# Error trap
trap {
    if (get-module -FullyQualifiedName AlexkUtils) {
        Get-ErrorReporting $_
        %FinishScript% 
    }
    Else {
        Write-Host "[$($MyInvocation.MyCommand.path)] There is error before logging initialized. Error: $_" -ForegroundColor Red
    }   
    exit 1
}
#################################  Mermaid diagram  #################################
```mermaid

```
################################# Script start here #################################






################################# Script end here ###################################
%FinishScript%