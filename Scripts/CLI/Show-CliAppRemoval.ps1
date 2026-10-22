# Shows the CLI app removal menu and prompts the user to select which apps to remove.
function Show-CliAppRemoval {
    Write-CliHeader "Remoção de aplicativos"

    Write-Output "> Abrindo a janela de seleção de aplicativos..."

    $result = Show-AppSelectionWindow

    if ($result -eq $true) {
        Write-Output "Você selecionou $($script:SelectedApps.Count) aplicativos para remoção"
        Add-Parameter 'RemoveApps'
        Add-Parameter 'Apps' ($script:SelectedApps -join ',')

        Save-Settings

        # Suppress prompt if Silent parameter was passed
        if (-not $Silent) {
            Write-Output ""
            Write-Output ""
            Write-Output "Pressione Enter para remover os aplicativos selecionados ou CTRL+C para sair..."
            Read-Host | Out-Null
            Write-CliHeader "Remoção de aplicativos"
        }
    }
    else {
        Write-Host "A seleção foi cancelada. Nenhum aplicativo foi removido" -ForegroundColor Red
        Write-Output ""
    }
}