# Shows the CLI last used settings from LastUsedSettings.json file, displays pending changes and prompts the user to apply them.
function Show-CliLastUsedSettings {
    Write-CliHeader 'Modo personalizado'

    try {
        Import-Settings -filePath $script:SavedSettingsFilePath -expectedVersion "1.0"
    }
    catch {
        Write-Error "Falha ao carregar as configurações de LastUsedSettings.json: $_"
        Wait-ForKeyPress -ExitCode 1
    }

    if ($Silent) {
        # Skip change summary and confirmation prompt
        return
    }

    Write-PendingChanges
    Write-CliHeader 'Modo personalizado'
}
