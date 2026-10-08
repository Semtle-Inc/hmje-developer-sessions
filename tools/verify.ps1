param([Parameter(ValueFromRemainingArguments=$true)][string[]]$RunnerArguments)
$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent
Push-Location $Root
$PreviousRoot = $env:HMJE_SESSIONS_ROOT
try {
    & "$PSScriptRoot/build.ps1" tools 세션검증 windows-exe
    $env:HMJE_SESSIONS_ROOT = $Root
    & (Join-Path $Root "build/세션검증.exe") @RunnerArguments
    $Result = $LASTEXITCODE
} finally {
    $env:HMJE_SESSIONS_ROOT = $PreviousRoot
    Pop-Location
}
exit $Result
