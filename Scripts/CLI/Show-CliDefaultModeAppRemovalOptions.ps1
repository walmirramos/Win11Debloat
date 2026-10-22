# Shows the CLI default mode app removal options. Loops until a valid option is selected.
function Show-CliDefaultModeAppRemovalOptions {
    Write-CliHeader 'Modo padrão'

    Write-Host "Atenção: a seleção padrão inclui Microsoft Teams, Spotify, Notas Autoadesivas e outros. Selecione a opção 2 para conferir e alterar os aplicativos que serão removidos" -ForegroundColor DarkGray
    Write-Host ""

    Do {
        Write-Host "Opções:" -ForegroundColor Yellow
        Write-Host " (n) Não remover aplicativos" -ForegroundColor Yellow
        Write-Host " (1) Remover apenas a seleção padrão de aplicativos" -ForegroundColor Yellow
        Write-Host " (2) Selecionar manualmente os aplicativos para remoção" -ForegroundColor Yellow
        $RemoveAppsInput = Read-Host "Deseja remover aplicativos? Eles serão removidos para todos os usuários (n/1/2)"

        # Show app selection form if user entered option 3
        if ($RemoveAppsInput -eq '2') {
            $result = Show-AppSelectionWindow

            if ($result -ne $true) {
                # User cancelled or closed app selection, change RemoveAppsInput so the menu will be shown again
                Write-Host ""
                Write-Host "Seleção de aplicativos cancelada. Tente novamente" -ForegroundColor Red

                $RemoveAppsInput = 'c'
            }
            
            Write-Host ""
        }
    }
    while ($RemoveAppsInput -ne 'n' -and $RemoveAppsInput -ne '0' -and $RemoveAppsInput -ne '1' -and $RemoveAppsInput -ne '2')

    return $RemoveAppsInput
}