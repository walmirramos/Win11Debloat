# Shows the CLI menu options and prompts the user to select one. Loops until a valid option is selected.
function Show-CliMenuOptions {
    Do {
        $ModeSelectionMessage = "Selecione uma opção (1/2)"

        Write-CliHeader 'Menu'

        Write-Host "(1) Modo padrão: aplicar rapidamente as alterações recomendadas"
        Write-Host "(2) Remoção de aplicativos: selecionar e remover aplicativos, sem outras alterações"

        # Only show this option if SavedSettings file exists
        if (Test-Path $script:SavedSettingsFilePath) {
            Write-Host "(3) Aplicar rapidamente as últimas configurações usadas"

            $ModeSelectionMessage = "Selecione uma opção (1/2/3)"
        }

        Write-Host ""
        Write-Host ""

        $Mode = Read-Host $ModeSelectionMessage

        if (($Mode -eq '3') -and -not (Test-Path $script:SavedSettingsFilePath)) {
            $Mode = $null
        }
    }
    while ($Mode -ne '1' -and $Mode -ne '2' -and $Mode -ne '3')

    return $Mode
}
