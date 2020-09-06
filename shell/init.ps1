Write-Host 'Setting profile for default pwsh session'

$Profiles = @(
    $Profile
)

Write-Host 'Installing Standard Modules'
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module 'InvokeBuild', 'PSFramework', 'AWS.Tools.Installer', 'Set-PSEnv', 'PSScriptAnalyzer', 'Pester' -Confirm:$false -Force -Scope AllUsers
Install-Module PSReadline -Confirm:$false -AllowPrerelease -Force -Scope AllUsers
Install-Module EditorServicesCommandSuite -Scope AllUsers -AllowPrerelease -Force

#$ProfileContent = Get-Content ./.devcontainer/profile.ps1 -Raw
$ProfileContent = Get-Content (Join-Path $PSScriptRoot 'profile.ps1') -Raw

switch -regex ($PSVersionTable.OS) {
    'Windows' {
        $Profiles += $Profile.Replace('Microsoft.PowerShell_profile', 'Microsoft.VSCode_profile')
        $Profiles += $Profile.Replace('Microsoft.VSCode_profile', 'Microsoft.PowerShell_profile')
    }
    'Darwin' {
        $Profiles += $Profile.Replace('Microsoft.PowerShell_profile', 'Microsoft.VSCode_profile')
        $Profiles += $Profile.Replace('Microsoft.VSCode_profile', 'Microsoft.PowerShell_profile')

    }
    'Linux' {
        $Profiles += '/root/.config/powershell/Microsoft.VSCode_profile.ps1'
        $Profiles += "${HOME}/.config/powershell/Microsoft.PowerShell_profile.ps1"
        $Profiles += "${HOME}/.config/powershell/Microsoft.VSCode_profile.ps1"
    }
}
($Profiles | Select-Object -Unique).ForEach{ New-Item -Path $_ -ItemType File -Value $ProfileContent -Force -ErrorAction SilentlyContinue -ErrorVariable err}
