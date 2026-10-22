# Show CLI default mode options for removing apps, or set selection if RunDefaults or RunDefaultsLite parameter was passed
function Show-CliDefaultModeOptions {
    if ($RunDefaults) {
        $RemoveAppsInput = '1'
    }
    elseif ($RunDefaultsLite) {
        $RemoveAppsInput = '0'                
    }
    else {
        $RemoveAppsInput = Show-CliDefaultModeAppRemovalOptions

        if ($RemoveAppsInput -eq '2' -and ($script:SelectedApps.contains('Microsoft.XboxGameOverlay') -or $script:SelectedApps.contains('Microsoft.XboxGamingOverlay')) -and 
          $( Read-Host -Prompt "Desativar a integração da Game Bar e a gravação de jogos/tela? Isso também impede os avisos de ms-gamingoverlay e ms-gamebar (s/n)" ) -in @('s', 'y')) {
            $DisableGameBarIntegrationInput = $true;
        }
    }

    Write-CliHeader 'Modo padrão'

    try {
        # Select app removal options based on user input
        switch ($RemoveAppsInput) {
            '1' {
                Add-Parameter 'RemoveApps'
                Add-Parameter 'Apps' 'Default'
            }
            '2' {
                Add-Parameter 'RemoveApps'
                Add-Parameter 'Apps' ($script:SelectedApps -join ',')

                if ($DisableGameBarIntegrationInput) {
                    Add-Parameter 'DisableDVR'
                    Add-Parameter 'DisableGameBarIntegration'
                }
            }
        }

        Import-Settings -filePath $script:DefaultSettingsFilePath -expectedVersion "1.0"
    }
    catch {
        Write-Error "Falha ao carregar as configurações de DefaultSettings.json: $_"
        Wait-ForKeyPress -ExitCode 1
    }

    Save-Settings

    if ($Silent) {
        # Skip change summary and confirmation prompt
        return
    }

    Write-PendingChanges
    Write-CliHeader 'Modo padrão'
}
