# Prints the header for the script
function Write-CliHeader {
    param (
        $title
    )

    $fullTitle = " Script Win11Debloat - $title"

    if ($script:Params.ContainsKey("Sysprep")) {
        $fullTitle = "$fullTitle (Modo Sysprep)"
    }
    else {
        $fullTitle = "$fullTitle (Usuário: $(Get-UserName))"
    }

    Clear-Host
    Write-Host "-------------------------------------------------------------------------------------------"
    Write-Host $fullTitle
    Write-Host "-------------------------------------------------------------------------------------------"
}
