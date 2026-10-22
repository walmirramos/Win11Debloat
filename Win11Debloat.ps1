[CmdletBinding(SupportsShouldProcess)]
param (
    [switch]$CLI,
    [switch]$Silent,
    [switch]$Sysprep,
    [string]$LogPath,
    [string]$Language,
    [string]$User,
    [Alias('NoRestartExplorer')]
    [switch]$SkipExplorerRestart,
    [switch]$CreateRestorePoint,
    [switch]$SkipRegistryBackup,
    [switch]$RunDefaults,
    [switch]$RunDefaultsLite,
    [switch]$RunSavedSettings,
    [string]$Config,
    [string]$Apps,
    [string]$AppRemovalTarget,
    [switch]$RemoveApps,
    [switch]$RemoveGamingApps,
    [switch]$RemoveHPApps,
    [switch]$ForceRemoveEdge,
    [switch]$DisableDVR,
    [switch]$DisableGameBarIntegration,
    [switch]$EnableWindowsSandbox,
    [switch]$EnableWindowsSubsystemForLinux,
    [switch]$DisableTelemetry,
    [switch]$DisableFastStartup,
    [switch]$DisableBitlockerAutoEncryption,
    [switch]$DisableModernStandbyNetworking,
    [switch]$DisableStorageSense,
    [switch]$DisableUpdateASAP,
    [switch]$PreventUpdateAutoReboot,
    [switch]$DisableDeliveryOptimization,
    [switch]$DisableDeviceAutoAppDownload,
    [switch]$DisableBing,
    [switch]$DisableNotifications,
    [switch]$DisableStoreSearchSuggestions,
    [switch]$DisableDesktopSpotlight,
    [switch]$HideDesktopSpotlightIcon,
    [switch]$EnableDesktopSpotlight,
    [switch]$DisableLockscreenTips,
    [switch]$DisableSuggestions,
    [switch]$DisableLocationServices,
    [switch]$DisableFindMyDevice,
    [switch]$DisableEdgeAds,
    [switch]$DisableBraveBloat,
    [switch]$DisableSettings365Ads,
    [switch]$DisableSettingsHome,
    [switch]$ShowHiddenFolders,
    [switch]$ShowKnownFileExt,
    [switch]$HideDupliDrive,
    [switch]$EnableDarkMode,
    [switch]$DisableTransparency,
    [switch]$DisableAnimations,
    [switch]$TaskbarAlignLeft,
    [switch]$CombineTaskbarAlways, [switch]$CombineTaskbarWhenFull, [switch]$CombineTaskbarNever,
    [switch]$CombineMMTaskbarAlways, [switch]$CombineMMTaskbarWhenFull, [switch]$CombineMMTaskbarNever,
    [switch]$MMTaskbarModeAll, [switch]$MMTaskbarModeMainActive, [switch]$MMTaskbarModeActive,
    [switch]$HideSearchTb, [switch]$ShowSearchIconTb, [switch]$ShowSearchLabelTb, [switch]$ShowSearchBoxTb,
    [switch]$HideTaskview,
    [switch]$DisableStartRecommended,
    [switch]$DisableStartAllApps, [switch]$StartAllAppsCategory, [switch]$StartAllAppsGrid, [switch]$StartAllAppsList,
    [switch]$DisableStartPhoneLink,
    [switch]$DisableCopilot,
    [switch]$DisableRecall,
    [switch]$DisableClickToDo,
    [switch]$DisableAISvcAutoStart,
    [switch]$DisablePaintAI,
    [switch]$DisableNotepadAI,
    [switch]$DisableEdgeAI,
	[switch]$DisableChromeAI,
    [switch]$DisableWidgets,
    [switch]$HideChat,
    [switch]$EnableEndTask,
    [switch]$EnableLastActiveClick,
    [switch]$ClearStart,
    [string]$ReplaceStart,
    [switch]$ClearStartAllUsers,
    [string]$ReplaceStartAllUsers,
    [switch]$RevertContextMenu,
    [switch]$DisableDragTray,
    [switch]$DisableMouseAcceleration,
    [switch]$DisableStickyKeys,
    [switch]$DisableWindowSnapping,
    [switch]$DisableSnapAssist,
    [switch]$DisableSnapLayouts,
    [switch]$HideTabsInAltTab, [switch]$Show3TabsInAltTab, [switch]$Show5TabsInAltTab, [switch]$Show20TabsInAltTab,
    [switch]$HideHome,
    [switch]$HideGallery,
    [switch]$ExplorerToHome,
    [switch]$ExplorerToThisPC,
    [switch]$ExplorerToDownloads,
    [switch]$ExplorerToOneDrive,
    [switch]$AddFoldersToThisPC,
    [switch]$HideOnedrive,
    [switch]$Hide3dObjects,
    [switch]$HideMusic,
    [switch]$HideIncludeInLibrary,
    [switch]$HideGiveAccessTo,
    [switch]$HideShare,
    [switch]$ShowDriveLettersFirst,
    [switch]$ShowDriveLettersLast,
    [switch]$ShowNetworkDriveLettersFirst,
    [switch]$HideDriveLetters
)

# Win11Debloat depends on Windows PowerShell 5.1 cmdlets (the Appx module's Get-AppxPackage /
# Remove-AppxPackage, and Get-ComputerRestorePoint) that do not load in PowerShell 7 (pwsh), where the
# Appx module fails with "Operation is not supported on this platform" (0x80131539). Without this guard
# the run continues and silently fails to remove any apps while still reporting success. See issue #675.
if ($PSVersionTable.PSEdition -eq 'Core') {
    Write-Host "O Win11Debloat requer o Windows PowerShell 5.1, mas está sendo executado no PowerShell $($PSVersionTable.PSVersion) (pwsh / edição Core)." -ForegroundColor Red
    Write-Host "A remoção de aplicativos e os pontos de restauração dependem de módulos indisponíveis no PowerShell 7. A execução não pode ser concluída corretamente nesta versão." -ForegroundColor Red
    Write-Host "Execute este script novamente no Windows PowerShell (powershell.exe)." -ForegroundColor Yellow
    exit 1
}

# Check if script is running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If script is not running as administrator ask user if they want to allow it
if (-not $isAdmin) {
    Write-Host "O Win11Debloat deve ser executado como administrador." -ForegroundColor Red

    $choice = Read-Host "Reiniciar como administrador? (s/n)"

    if ($choice -match '^[SsYy]$') {
        # Win32-safe escaping for arguments to pass to elevated process
        function Format-ElevatedArg([string]$Value) {
            $escaped = $Value -replace '(\\*)"', '$1$1\"'
            $escaped = $escaped -replace '(\\+)$', '$1$1'
            return '"' + $escaped + '"'
        }

        $elevatedArgs = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", (Format-ElevatedArg $PSCommandPath))

        foreach ($paramName in $PSBoundParameters.Keys) {
            $paramValue = $PSBoundParameters[$paramName]

            if ($paramValue -is [System.Management.Automation.SwitchParameter]) {
                if ($paramValue.IsPresent) {
                    $elevatedArgs += "-$paramName"
                }
            }
            else {
                $elevatedArgs += "-$paramName"
                $elevatedArgs += (Format-ElevatedArg $paramValue)
            }
        }

        if ($MyInvocation.UnboundArguments.Count -gt 0) {
            foreach ($unboundArg in $MyInvocation.UnboundArguments) {
                $elevatedArgs += (Format-ElevatedArg "$unboundArg")
            }
        }

        try {
            Start-Process powershell -ArgumentList $elevatedArgs -Verb RunAs -ErrorAction Stop
        }
        catch {
            Write-Error "Falha ao iniciar o Win11Debloat como administrador: $_"
            Exit 1
        }

        Exit 0
    }

    Exit 1
}

# Define script-level variables & paths
$script:Version = "2026.08.24"
$configPath = Join-Path $PSScriptRoot 'Config'
$script:UserDataPath = Join-Path $env:LOCALAPPDATA 'Win11Debloat'
$script:LogsPath = Join-Path $script:UserDataPath 'Logs'
$schemasPath = Join-Path $PSScriptRoot 'Schemas'
$scriptsPath = Join-Path $PSScriptRoot 'Scripts'

$script:AppsListFilePath = Join-Path $configPath 'Apps.json'
$script:DefaultSettingsFilePath = Join-Path $configPath 'DefaultSettings.json'
$script:FeaturesFilePath = Join-Path $configPath 'Features.json'
$script:SavedSettingsFilePath = Join-Path $script:UserDataPath 'LastUsedSettings.json'
$script:UiPreferencesFilePath = Join-Path $script:UserDataPath 'Preferences.json'
$script:LanguagesPath = Join-Path $configPath 'Languages'
$script:DefaultLanguagePath = Join-Path $script:LanguagesPath 'en-US'
$script:DefaultLogPath = Join-Path $script:LogsPath 'Win11Debloat.log'
$script:RegfilesPath = Join-Path $PSScriptRoot 'Regfiles'
$script:RegistryBackupsPath = Join-Path $script:UserDataPath 'Backups'
$script:AssetsPath = Join-Path $PSScriptRoot 'Assets'
$script:AppSelectionSchema = Join-Path $schemasPath 'AppSelectionWindow.xaml'
$script:MainWindowSchema = Join-Path $schemasPath 'MainWindow.xaml'
$script:MessageBoxSchema = Join-Path $schemasPath 'MessageBox.xaml'
$script:AboutWindowSchema = Join-Path $schemasPath 'AboutWindow.xaml'
$script:ApplyChangesWindowSchema = Join-Path $schemasPath 'ApplyChangesWindow.xaml'
$script:SharedStylesSchema = Join-Path $schemasPath 'SharedStyles.xaml'
$script:BubbleHintSchema = Join-Path $schemasPath 'BubbleHint.xaml'
$script:ImportExportConfigSchema = Join-Path $schemasPath 'ImportExportConfigWindow.xaml'
$script:RestoreBackupWindowSchema = Join-Path $schemasPath 'RestoreBackupWindow.xaml'
$script:LoadAppsDetailsScriptPath = Join-Path (Join-Path $scriptsPath 'FileIO') 'Import-AppDetailsFromJson.ps1'
$script:TestAppInWingetListScriptPath = Join-Path (Join-Path $scriptsPath 'AppRemoval') 'Test-AppInWingetList.ps1'
$script:ImportLanguageFileScriptPath = Join-Path (Join-Path $scriptsPath 'FileIO') 'Import-LanguageFile.ps1'

$script:ControlParams = 'WhatIf', 'Confirm', 'Verbose', 'Debug', 'LogPath', 'Language', 'Silent', 'Sysprep', 'User', 'SkipExplorerRestart', 'SkipRegistryBackup', 'RunDefaults', 'RunDefaultsLite', 'RunSavedSettings', 'Config', 'CLI', 'AppRemovalTarget'

# Script-level variables for GUI elements
$script:GuiWindow = $null
$script:CancelRequested = $false
$script:ApplyProgressCallback = $null
$script:ApplySubStepCallback = $null
$script:RegistryImportFailures = 0
$script:AppRemovalFailures = 0
$script:AppRemovalVerificationUnavailable = $false

# Check if current PowerShell environment is limited by security policies
if ($ExecutionContext.SessionState.LanguageMode -ne "FullLanguage") {
    Write-Error "O Win11Debloat não pode ser executado: políticas de segurança restringem a execução do PowerShell"
    Write-Output "Pressione qualquer tecla para sair..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

Clear-Host

# Ensure required Windows command paths are present in PATH for this session.
$system32Path = "$env:SystemRoot\System32"
if ($env:PATH -notmatch "(?i)(^|;)$([regex]::Escape($system32Path))(?=;|$)") {
    $env:PATH = "$env:SystemRoot\System32;$env:SystemRoot;" + $env:PATH
    Write-Warning "O caminho System32 não estava na variável PATH e foi adicionado para esta sessão."
}

# Display ASCII art launch logo in CLI
Write-Host ""
Write-Host ""
Write-Host "                   " -NoNewline; Write-Host "      ^" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "     / \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "    /   \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "   /     \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  / ===== \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host "  ---  " -ForegroundColor White -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host " ( O ) " -ForegroundColor DarkCyan -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |" -ForegroundColor Blue -NoNewline; Write-Host "  ---  " -ForegroundColor White -NoNewline; Write-Host "|" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |       |" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host " /|       |\" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "/ |       | \" -ForegroundColor Blue
Write-Host "                   " -NoNewline; Write-Host "  |  " -ForegroundColor DarkGray -NoNewline; Write-Host "'''" -ForegroundColor Red -NoNewline; Write-Host "  |" -ForegroundColor DarkGray -NoNewline; Write-Host "    *" -ForegroundColor Yellow
Write-Host "                   " -NoNewline; Write-Host "    (" -ForegroundColor Yellow -NoNewline; Write-Host "'''" -ForegroundColor Red -NoNewline; Write-Host ") " -ForegroundColor Yellow -NoNewline; Write-Host "   *  *" -ForegroundColor DarkYellow
Write-Host "                   " -NoNewline; Write-Host "    ( " -ForegroundColor DarkYellow -NoNewline; Write-Host "'" -ForegroundColor Red -NoNewline; Write-Host " )   " -ForegroundColor DarkYellow -NoNewline; Write-Host "*" -ForegroundColor Yellow
Write-Host ""
Write-Host "             Iniciando o Win11Debloat..." -ForegroundColor White
Write-Host "                Mantenha esta janela aberta" -ForegroundColor DarkGray
Write-Host ""
Write-Host ""

# Log script output to 'Win11Debloat.log' at the specified path
if ($LogPath -and (Test-Path $LogPath)) {
    Start-Transcript -Path (Join-Path $LogPath 'Win11Debloat.log') -Append -IncludeInvocationHeader -Force | Out-Null
}
else {
    Start-Transcript -Path $script:DefaultLogPath -Append -IncludeInvocationHeader -Force | Out-Null
}

# When Group Policy overrides Run.bat's Process-scope Bypass, marked PowerShell source files
# can prompt as they are dot-sourced. Outside -WhatIf, remove Mark-of-the-Web only from marked
# .ps1, .psm1, and .psd1 files under Scripts; leave all other downloaded files untouched.
# See issue #720.
if (-not $WhatIfPreference) {
    $gpoExecutionPolicySet = (Get-ExecutionPolicy -Scope MachinePolicy) -ne 'Undefined' -or
        (Get-ExecutionPolicy -Scope UserPolicy) -ne 'Undefined'

    if ($gpoExecutionPolicySet) {
        $markedScriptFiles = @(Get-ChildItem -LiteralPath $scriptsPath -Recurse -File |
            Where-Object { $_.Extension -in '.ps1', '.psm1', '.psd1' } |
            Where-Object {
                Get-Item -LiteralPath $_.FullName -Stream * -ErrorAction SilentlyContinue |
                    Where-Object { $_.Stream -eq 'Zone.Identifier' }
            })

        if ($markedScriptFiles.Count -gt 0) {
            Write-Host "Desbloqueando $($markedScriptFiles.Count) arquivo(s) do PowerShell..."
            $unblockErrors = @()
            $markedScriptFiles | Unblock-File -ErrorAction SilentlyContinue -ErrorVariable +unblockErrors

            if ($unblockErrors.Count -gt 0) {
                Write-Warning "Falha ao desbloquear $($unblockErrors.Count) arquivo(s) do PowerShell."
            }
            else {
                Write-Host "Todos os arquivos foram desbloqueados com sucesso."
            }
        }
    }
}

# Check if the device is domain-joined and warn the user (Group Policy may override changes)
try {
    $computerSystem = Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue
    if ($null -ne $computerSystem -and $computerSystem.PartOfDomain) {
        Write-Warning "Este computador pertence a um domínio. As políticas de grupo podem substituir as alterações do Win11Debloat."
    }
}
catch { }

# Check if script has all required files
if (-not ((Test-Path $script:DefaultSettingsFilePath) -and (Test-Path $script:AppsListFilePath) -and (Test-Path $script:RegfilesPath) -and (Test-Path $script:AssetsPath) -and (Test-Path $script:AppSelectionSchema) -and (Test-Path $script:ApplyChangesWindowSchema) -and (Test-Path $script:SharedStylesSchema) -and (Test-Path $script:BubbleHintSchema) -and (Test-Path $script:RestoreBackupWindowSchema) -and (Test-Path $script:FeaturesFilePath) -and (Test-Path $script:DefaultLanguagePath))) {
    Write-Error "O Win11Debloat não encontrou arquivos necessários. Verifique se todos os arquivos do script estão presentes"
    Write-Output "Pressione qualquer tecla para sair..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

# Load feature info from file
$script:Features = @{}
try {
    $featuresData = Get-Content -Path $script:FeaturesFilePath -Raw | ConvertFrom-Json
    foreach ($feature in $featuresData.Features) {
        if ([string]::IsNullOrWhiteSpace([string]$feature.FeatureId) -or [string]::IsNullOrWhiteSpace([string]$feature.Label) -or [string]::IsNullOrWhiteSpace([string]$feature.ApplyText)) {
            Write-Warning "O recurso '$($feature.FeatureId)' não possui FeatureId, Label ou ApplyText em Features.json e será ignorado."
            continue
        }
        $script:Features[$feature.FeatureId] = $feature
    }
}
catch {
    Write-Error "Falha ao carregar as informações dos recursos de Features.json"
    Write-Output "Pressione qualquer tecla para sair..."
    $null = [System.Console]::ReadKey()
    Exit 1
}

# Check if WinGet is installed & if it is, check if the version is at least v1.4
try {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        $script:WingetInstalled = $true
    }
    else {
        $script:WingetInstalled = $false
    }
}
catch {
    Write-Error "Não foi possível verificar se o WinGet está instalado. Falha no comando winget: $_"
    $script:WingetInstalled = $false
}

# Show WinGet warning that requires user confirmation, Suppress confirmation if Silent parameter was passed
if (-not $script:WingetInstalled -and -not $Silent) {
    Write-Warning "O WinGet não está instalado ou está desatualizado. Isso pode impedir a remoção de alguns aplicativos"
    Write-Output ""
    Write-Output "Pressione qualquer tecla para continuar mesmo assim..."
    $null = [System.Console]::ReadKey()
}



##################################################################################################################
#                                                                                                                #
#                                                FUNCTION IMPORTS                                                #
#                                                                                                                #
##################################################################################################################

# App removal functions
. "$PSScriptRoot/Scripts/AppRemoval/Invoke-ForceRemoveEdge.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Remove-SelectedApps.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Get-WingetInstalledApps.ps1"
. "$PSScriptRoot/Scripts/AppRemoval/Test-AppInWingetList.ps1"

# CLI functions
. "$PSScriptRoot/Scripts/CLI/Wait-ForKeyPress.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliLastUsedSettings.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliDefaultModeAppRemovalOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliDefaultModeOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliAppRemoval.ps1"
. "$PSScriptRoot/Scripts/CLI/Show-CliMenuOptions.ps1"
. "$PSScriptRoot/Scripts/CLI/Write-PendingChanges.ps1"
. "$PSScriptRoot/Scripts/CLI/Write-CliHeader.ps1"

# Features functions
. "$PSScriptRoot/Scripts/Features/Get-CurrentTweakState.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-Changes.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-SystemRestorePoint.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistryFeatureSelection.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistrySnapshotCapture.ps1"
. "$PSScriptRoot/Scripts/Features/Backup-RegistryState.ps1"
. "$PSScriptRoot/Scripts/Features/Registry-BackupValidation.ps1"
. "$PSScriptRoot/Scripts/Features/Restore-RegistryApplyState.ps1"
. "$PSScriptRoot/Scripts/Features/Restore-RegistryBackup.ps1"
. "$PSScriptRoot/Scripts/Features/Set-StoreSearchSuggestions.ps1"
. "$PSScriptRoot/Scripts/Features/Telemetry-ScheduledTasks.ps1"
. "$PSScriptRoot/Scripts/Features/Windows-OptionalFeatures.ps1"
. "$PSScriptRoot/Scripts/Features/Import-RegistryFile.ps1"
. "$PSScriptRoot/Scripts/Features/Replace-StartMenu.ps1"
. "$PSScriptRoot/Scripts/Features/Invoke-RestartExplorer.ps1"

# File I/O functions
. "$PSScriptRoot/Scripts/FileIO/Import-JsonFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-LanguageFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Save-ToFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Save-Settings.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-Settings.ps1"
. "$PSScriptRoot/Scripts/FileIO/Get-ValidatedAppList.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppsFromFile.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppDetailsFromJson.ps1"
. "$PSScriptRoot/Scripts/FileIO/Import-AppPresetsFromJson.ps1"

# GUI functions
. "$PSScriptRoot/Scripts/GUI/Get-SystemUsesDarkMode.ps1"
. "$PSScriptRoot/Scripts/GUI/Ui-Preferences.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-Localization.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-SettingsDialog.ps1"
. "$PSScriptRoot/Scripts/GUI/Set-WindowThemeResources.ps1"
. "$PSScriptRoot/Scripts/GUI/Attach-ShiftClickBehavior.ps1"
. "$PSScriptRoot/Scripts/GUI/Apply-SettingsToUiControls.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-MessageBox.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-ImportExportConfigWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-ApplyModal.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-AppSelectionWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-RestoreBackupWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Restore-BackupDialogFeatureLists.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-RestoreBackupDialog.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-WindowChrome.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-AppSelection.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-TweaksBuilder.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-Navigation.ps1"
. "$PSScriptRoot/Scripts/GUI/MainWindow-Deployment.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-MainWindow.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-AboutDialog.ps1"
. "$PSScriptRoot/Scripts/GUI/Show-Bubble.ps1"

# Helper functions
. "$PSScriptRoot/Scripts/Helpers/Add-Parameter.ps1"
. "$PSScriptRoot/Scripts/Helpers/Resolve-UserProfilePath.ps1"
. "$PSScriptRoot/Scripts/Helpers/User-HiveHelpers.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-UserProfileExists.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-ModernStandbySupport.ps1"
. "$PSScriptRoot/Scripts/Helpers/Generate-AppsList.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-FriendlyRegistryBackupTarget.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-FriendlyTargetUserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-RebootFeatureLabels.ps1"
. "$PSScriptRoot/Scripts/Helpers/Windows-BuildHelpers.ps1"
. "$PSScriptRoot/Scripts/Helpers/Import-ConfigToParams.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-ConfigConsistency.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-TargetUserForAppRemoval.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-RegFileOperations.ps1"
. "$PSScriptRoot/Scripts/Helpers/Test-TargetUserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-UserDirectory.ps1"
. "$PSScriptRoot/Scripts/Helpers/Get-UserName.ps1"
. "$PSScriptRoot/Scripts/Helpers/Registry-PathHelpers.ps1"
. "$PSScriptRoot/Scripts/Helpers/Apply-RegistryRegFile.ps1"
. "$PSScriptRoot/Scripts/Helpers/Confirm-UnsafeAppRemoval.ps1"

# Threading functions
. "$PSScriptRoot/Scripts/Threading/Invoke-DoEvents.ps1"
. "$PSScriptRoot/Scripts/Threading/Invoke-NonBlocking.ps1"



##################################################################################################################
#                                                                                                                #
#                                                  SCRIPT START                                                  #
#                                                                                                                #
##################################################################################################################



# Get current Windows build version
$WinVersion = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentBuild

# Check if the machine supports Modern Standby, this is used to determine if the DisableModernStandbyNetworking option can be used
$script:ModernStandbySupported = Test-ModernStandbySupport

# Explicit -Language takes precedence over saved UI preferences and the system culture.
Initialize-UiPreferences -Language $Language
# Use the active catalog for terminal summaries and progress messages.
foreach ($feature in $script:Features.Values) {
    foreach ($field in @('Label', 'ApplyText', 'UndoLabel', 'ApplyUndoText')) {
        if ($feature.PSObject.Properties[$field]) {
            $feature.$field = Get-Translation -Key $feature.FeatureId -Field $field -Section Features
        }
    }
}

$script:Params = $PSBoundParameters
$script:UndoParams = @{}

# Add default Apps parameter when RemoveApps is requested and Apps was not explicitly provided
if ((-not $script:Params.ContainsKey("Apps")) -and $script:Params.ContainsKey("RemoveApps")) {
    $script:Params.Add('Apps', 'Default')
}

$controlParamsCount = 0

# Count how many control parameters are set, to determine if any changes were selected by the user during runtime
foreach ($Param in $script:ControlParams) {
    if ($script:Params.ContainsKey($Param)) {
        $controlParamsCount++
    }
}

# Hide progress bars for app removal, as they block Win11Debloat's output
if (-not ($script:Params.ContainsKey("Verbose"))) {
    $ProgressPreference = 'SilentlyContinue'
}
else {
    Write-Host "O modo de mensagens detalhadas está ativado"
    Write-Output ""
    Write-Output "Pressione qualquer tecla para continuar..."
    $null = [System.Console]::ReadKey()

    $ProgressPreference = 'Continue'
}

if ($script:Params.ContainsKey("Sysprep")) {
    Get-UserDirectory -userName "Default" | Out-Null

    # Exit script if run in Sysprep mode on Windows 10
    if ($WinVersion -lt 22000) {
        Write-Error "O modo Sysprep do Win11Debloat não é compatível com o Windows 10"
        Wait-ForKeyPress -ExitCode 1
    }
}

# Ensure that target user exists, if User or AppRemovalTarget parameter was provided
if ($script:Params.ContainsKey("User")) {
    Get-UserDirectory -userName $script:Params.Item("User") | Out-Null
}
if ($script:Params.ContainsKey("AppRemovalTarget")) {
    $appRemovalTargetValue = $script:Params.Item("AppRemovalTarget")
    # 'AllUsers' / 'CurrentUser' are sentinel scope values, not real usernames - don't resolve them as a profile
    if ($appRemovalTargetValue -notin @('AllUsers', 'CurrentUser')) {
        Get-UserDirectory -userName $appRemovalTargetValue | Out-Null
    }
}

# Remove LastUsedSettings.json file if it exists and is empty
if ((Test-Path $script:SavedSettingsFilePath) -and ([String]::IsNullOrWhiteSpace((Get-content $script:SavedSettingsFilePath)))) {
    Remove-Item -Path $script:SavedSettingsFilePath -Force
}

# Default to CLI mode for deployment-targeted parameters.
$launchInCLI = $CLI -or $script:Params.ContainsKey("User") -or $script:Params.ContainsKey("Sysprep") -or $script:Params.ContainsKey("AppRemovalTarget")

# Change script execution based on provided parameters or user input
if ((-not $script:Params.Count) -or $RunDefaults -or $RunDefaultsLite -or $RunSavedSettings -or $Config -or ($controlParamsCount -eq $script:Params.Count)) {
    if ($RunDefaults -or $RunDefaultsLite) {
        Show-CliDefaultModeOptions
    }
    elseif ($RunSavedSettings) {
        if (-not (Test-Path $script:SavedSettingsFilePath)) {
            Write-CliHeader 'Custom Mode'
            Write-Error "O arquivo LastUsedSettings.json não foi encontrado. Nenhuma alteração foi feita"
            Wait-ForKeyPress -ExitCode 1
        }

        Show-CliLastUsedSettings
    }
    elseif ($Config) {
        try {
            Import-ConfigToParams -ConfigPath $Config -CurrentBuild $WinVersion -ExpectedVersion '1.0'
        }
        catch {
            Write-Error "$_"
            Wait-ForKeyPress -ExitCode 1
        }

        if (-not $Silent) {
            Write-CliHeader 'Custom Mode'
            Write-PendingChanges
            Write-CliHeader 'Custom Mode'
        }
    }
    else {
        if ($launchInCLI) {
            $Mode = Show-CliMenuOptions
        }
        else {
            try {
                $result = Show-MainWindow
            
                try {
                    Stop-Transcript
                }
                catch { }

                Exit
            }
            catch {
                Write-Warning "Não foi possível iniciar a interface gráfica: $($_.Exception.Message)"
                Write-Verbose "GUI Failure details: $($_.Exception.ToString())"
                if (-not $Silent) {
                    Write-Host ""
                    Write-Host "Pressione qualquer tecla para continuar no modo de linha de comando..."
                    $null = [System.Console]::ReadKey()
                }

                $Mode = Show-CliMenuOptions
            }
        }
    }

    # Add execution parameters based on the mode
    switch ($Mode) {
        # Default mode, loads defaults and app removal options
        '1' { 
            Show-CliDefaultModeOptions
        }

        # App removal, remove apps based on user selection
        '2' {
            Show-CliAppRemoval
        }

        # Load last used options from the "LastUsedSettings.json" file
        '3' {
            Show-CliLastUsedSettings
        }
    }
}
else {
    Write-CliHeader 'Configuration'
}

# If the number of keys in ControlParams equals the number of keys in Params then no modifications/changes were selected
#  or added by the user, and the script can exit without making any changes.
if (($controlParamsCount -eq $script:Params.Keys.Count) -or ($script:Params.Keys.Count -eq 1 -and ($script:Params.Keys -contains 'CreateRestorePoint' -or $script:Params.Keys -contains 'Apps'))) {
    Write-Output "O script foi concluído sem fazer alterações."
    Wait-ForKeyPress
}

# Execute all selected/provided parameters using the consolidated function
# (This also handles restore point creation if requested)
Invoke-AllChanges

if ($script:CancelRequested) {
    Write-Warning "A execução foi cancelada pelo usuário. As alterações restantes não foram aplicadas."
    Wait-ForKeyPress
}

# Restart Explorer process unless running in Sysprep or User context
if (-not ($script:Params.ContainsKey("Sysprep") -or $script:Params.ContainsKey("User"))) {
    Invoke-RestartExplorer
}

Write-Output ""
Write-Output ""
Write-Output ""
Write-Output "Script concluído! Confira acima se ocorreu algum erro."

Wait-ForKeyPress
