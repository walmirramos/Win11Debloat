[CmdletBinding()]
param(
    [string]$OutputDirectory = (Join-Path (Split-Path $PSScriptRoot -Parent) 'artifacts'),
    [version]$Version = '1.0.0.0'
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$repositoryRoot = Split-Path $PSScriptRoot -Parent
$uncommitted = @(& git -C $repositoryRoot status --porcelain)
if ($LASTEXITCODE -ne 0 -or $uncommitted.Count) { throw 'Faça commit dos fontes antes de gerar o pacote para registrar sua origem corretamente.' }
$outputRoot = [IO.Path]::GetFullPath($OutputDirectory)
[void][IO.Directory]::CreateDirectory($outputRoot)
$stage = Join-Path $outputRoot ('stage-' + [guid]::NewGuid().ToString('N'))
$package = Join-Path $stage 'Win11Debloat'
$archiveFile = Join-Path $outputRoot 'Win11Debloat-com-EXE.zip'
$hashFile = Join-Path $outputRoot 'Win11Debloat-SHA256.txt'
$temporaryArchive = Join-Path $outputRoot ('package-' + [guid]::NewGuid().ToString('N') + '.tmp')
try {
    [void][IO.Directory]::CreateDirectory($package)
    foreach ($folder in @('Assets','Config','Regfiles','Schemas','Scripts','Launcher','docs')) {
        $source = Join-Path $repositoryRoot $folder
        if (-not (Test-Path -LiteralPath $source -PathType Container)) { throw "Pasta necessária não encontrada: $folder" }
        Copy-Item -LiteralPath $source -Destination (Join-Path $package $folder) -Recurse
    }
    foreach ($file in @('Win11Debloat.ps1','Run.bat','LICENSE','LICENCA.pt-BR.md','README.md','CODE_SIGNING.md','PRIVACY.md')) {
        Copy-Item -LiteralPath (Join-Path $repositoryRoot $file) -Destination (Join-Path $package $file)
    }
    & (Join-Path $PSScriptRoot 'Build-Launcher.ps1') -OutputDirectory $package -Version $Version
    $commit = (& git -C $repositoryRoot rev-parse HEAD | Out-String).Trim()
    if ($LASTEXITCODE -ne 0 -or $commit -notmatch '^[a-f0-9]{40}$') { throw 'Não foi possível identificar o commit dos fontes.' }
    $exe = Join-Path $package 'Win11Debloat.exe'
    $signature = Get-AuthenticodeSignature -LiteralPath $exe
    if ($signature.Status -ne 'NotSigned') { throw 'Esta rotina prepara somente a compilação sem assinatura.' }
    $assembly = [Reflection.Assembly]::Load([IO.File]::ReadAllBytes($exe))
    if ($null -ne [Launcher]::MissingResource([string]$package)) { throw 'Arquivos de execução incompletos.' }
    $launchInfo = [Launcher]::CreateStartInfo([string]$package)
    if ($launchInfo.Arguments -notmatch '-Language pt-BR' -or $launchInfo.Arguments -match '-Silent|-RunDefaults') { throw 'Argumentos inesperados no iniciador.' }
    if ($launchInfo.WindowStyle -ne 'Normal') { throw 'A janela do PowerShell deve permanecer visível.' }
    $sourceInfo = [ordered]@{
        Project = 'Win11Debloat'; Version = $assembly.GetName().Version.ToString();
        Repository = 'https://github.com/walmirramos/Win11Debloat'; Commit = $commit;
        SigningStatus = 'NotSigned'; ExeSHA256 = (Get-FileHash -LiteralPath $exe -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $sourceInfo | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $package 'SOURCE.json') -Encoding UTF8
    @'
WIN11DEBLOAT — PACOTE PORTÁTIL

Extraia o ZIP inteiro e abra Win11Debloat.exe. Mantenha as pastas junto do EXE.
O controle de conta de usuário solicitará acesso de administrador.
Abrir o programa não aplica ajustes automaticamente. Revise antes de aplicar.

Este executável ainda não possui assinatura digital. Não desative o antivírus.
Consulte CODE_SIGNING.md, PRIVACY.md e a Wiki para mais informações.
SOURCE.json identifica o commit dos fontes e o SHA-256 do EXE.
'@ | Set-Content -LiteralPath (Join-Path $package 'LEIA-ME-PRIMEIRO.txt') -Encoding UTF8
    [IO.Compression.ZipFile]::CreateFromDirectory($stage,$temporaryArchive,[IO.Compression.CompressionLevel]::Optimal,$false)
    $zip = [IO.Compression.ZipFile]::OpenRead($temporaryArchive)
    try {
        foreach ($entry in @('Win11Debloat/Win11Debloat.exe','Win11Debloat/Win11Debloat.ps1','Win11Debloat/SOURCE.json','Win11Debloat/Config/Languages/pt-BR/Chrome.json')) {
            if (-not $zip.GetEntry($entry)) { throw "Arquivo ausente no ZIP: $entry" }
        }
    }
    finally { $zip.Dispose() }
    Move-Item -LiteralPath $temporaryArchive -Destination $archiveFile -Force
    @(
        ((Get-FileHash -LiteralPath $archiveFile -Algorithm SHA256).Hash.ToLowerInvariant() + '  Win11Debloat-com-EXE.zip'),
        ($sourceInfo.ExeSHA256 + '  Win11Debloat.exe')
    ) | Set-Content -LiteralPath $hashFile -Encoding ASCII
    Write-Output "Pacote: $archiveFile"
    Write-Output "SHA-256: $hashFile"
    Write-Output "Fontes: $commit — Assinatura: NotSigned"
}
finally {
    # The staging directory was created by this process directly inside the output root.
    $resolvedStage = [IO.Path]::GetFullPath($stage)
    if ((Split-Path $resolvedStage -Parent) -ne $outputRoot -or (Split-Path $resolvedStage -Leaf) -notmatch '^stage-[a-f0-9]{32}$') { throw 'Caminho de limpeza inesperado.' }
    if (Test-Path -LiteralPath $resolvedStage) { Remove-Item -LiteralPath $resolvedStage -Recurse -Force }
    if (Test-Path -LiteralPath $temporaryArchive) { Remove-Item -LiteralPath $temporaryArchive -Force }
}
