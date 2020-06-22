Write-Host "Setting profile for default pwsh session"

$Profiles = @(
    $Profile
    '/root/.config/powershell/Microsoft.VSCode_profile.ps1'
    '/home/codespace/.config/powershell/Microsoft.PowerShell_profile.ps1'
    '/home/codespace/.config/powershell/Microsoft.PowerShell_profile.ps1'
)
$Profiles.ForEach{ New-Item -Path $_ -ItemType File -Force -ErrorAction SilentlyContinue -ErrorVariable err }


Write-Host "configuring alias for terraform"
$Profiles.ForEach{
    try
    {
        $p = $_; New-Alias "tf" "terraform" -ErrorAction SilentlyContinue | Out-File -FilePath $p
        $p = $_; New-Alias "ib" "Invoke-Build" -ErrorAction SilentlyContinue | Out-File -FilePath $p
    }
    catch
    {
        Write-Warning $_.Exception.InnerException.Message
    }
}

Write-Host "Installing Standard Modules"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module 'InvokeBuild', 'PSFramework', 'AWS.Tools.Installer', 'Set-PSEnv', 'PSScriptAnalyzer','Pester' -Confirm:$false -Force
Install-Module PSReadline -Confirm:$false -AllowPrerelease -Force
Install-Module EditorServicesCommandSuite -Scope CurrentUser -AllowPrerelease -Force


$ProfileContent = Get-Content ./profile.ps1 -Raw
$Profiles.ForEach{
    try
    {
        $p = $_; $ProfileContent | Out-File $p -Force -ErrorAction SilentlyContinue
    }
    catch
    {
        Write-Warning $_.Exception.InnerException.Message
    }
}


$err | Write-Warning