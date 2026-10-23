param(
    [string]$OutputDirectory = (Split-Path $PSScriptRoot -Parent),
    [version]$Version = '1.0.0.0'
)
$ErrorActionPreference = 'Stop'
$compiler = Join-Path $env:WINDIR 'Microsoft.NET\Framework64\v4.0.30319\csc.exe'
if (-not (Test-Path -LiteralPath $compiler)) { throw 'Compilador C# do .NET Framework 4 não encontrado.' }
[void][IO.Directory]::CreateDirectory($OutputDirectory)
$outputFile = Join-Path $OutputDirectory 'Win11Debloat.exe'
$versionText = '{0}.{1}.{2}.{3}' -f $Version.Major, $Version.Minor, [Math]::Max(0,$Version.Build), [Math]::Max(0,$Version.Revision)
$temporarySource = Join-Path $OutputDirectory ('Launcher-' + [guid]::NewGuid().ToString('N') + '.cs')
try {
    $source = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'Launcher.cs'))
    $source = $source -replace '(Assembly(?:File)?Version\(")[^"]+("\))', ('${1}' + $versionText + '${2}')
    [IO.File]::WriteAllText($temporarySource, $source, [Text.UTF8Encoding]::new($true))
    & $compiler /nologo /target:winexe /platform:anycpu /optimize+ "/out:$outputFile" "/win32manifest:$PSScriptRoot\app.manifest" /reference:System.Windows.Forms.dll $temporarySource
    if ($LASTEXITCODE -ne 0) { throw 'Falha ao compilar o iniciador.' }
}
finally {
    if (Test-Path -LiteralPath $temporarySource) { Remove-Item -LiteralPath $temporarySource -Force }
}
Write-Output "Executável criado: $outputFile"
