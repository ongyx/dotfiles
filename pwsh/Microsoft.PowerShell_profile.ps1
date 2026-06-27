$env:GIT_SSH = $((Get-Command -Name ssh).Source)

Set-Alias -Name openssl -Value "C:\Program Files\Git\usr\bin\openssl.exe"

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

hcloud completion powershell | Out-String | Invoke-Expression
