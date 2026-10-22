param([string]$OutputDirectory = (Split-Path $PSScriptRoot -Parent))
$ErrorActionPreference = 'Stop'
$compiler = Join-Path $env:WINDIR 'Microsoft.NET\Framework64\v4.0.30319\csc.exe'
if (-not (Test-Path -LiteralPath $compiler)) { throw 'Compilador C# do .NET Framework 4 não encontrado.' }
[void][IO.Directory]::CreateDirectory($OutputDirectory)
$outputFile = Join-Path $OutputDirectory 'Win11Debloat.exe'
& $compiler /nologo /target:winexe /platform:anycpu /optimize+ "/out:$outputFile" "/win32manifest:$PSScriptRoot\app.manifest" /reference:System.Windows.Forms.dll "$PSScriptRoot\Launcher.cs"
if ($LASTEXITCODE -ne 0) { throw 'Falha ao compilar o iniciador.' }
Write-Output "Executável criado: $outputFile"
