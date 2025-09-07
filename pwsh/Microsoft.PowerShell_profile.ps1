$env:GIT_SSH = $((Get-Command -Name ssh).Source)

function ln($target, $link) {
    if ($target -and $link) {
        New-Item -Path $link -ItemType SymbolicLink -Value $target
    } else {
        Write-Host "usage: ln <target> <link>"
        return
    }
}

function pyenv() {
    & "$env:USERPROFILE/.venv/Scripts/activate.ps1"
}
