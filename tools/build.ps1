param(
    [Parameter(Mandatory=$true)][string]$Source,
    [string]$Artifact = "",
    [string]$Target = "windows-exe"
)
$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent
Push-Location $Root
try {
    $Compiler = if ($env:HMJEC) { $env:HMJEC } else { "hmjec" }
    if (!$Artifact) { $Artifact = [IO.Path]::GetFileNameWithoutExtension($Source.TrimEnd('/','\')) }
    New-Item -ItemType Directory -Force (Join-Path $Root "build") | Out-Null
    $Output = Join-Path $Root "build/$Artifact"
    if ($Target -eq "windows-exe") { $Output += ".exe" }
    if (Test-Path $Source -PathType Container) {
        & $Compiler --project $Source --artifact $Artifact --target $Target -o $Output
    } else {
        & $Compiler --target $Target $Source -o $Output
    }
    if ($LASTEXITCODE -ne 0) { throw "컴파일 실패: $LASTEXITCODE" }
    Write-Output "출력: $Output"
} finally { Pop-Location }
