Write-Host "Setting profile for default pwsh session"

$Profiles = @(
    $Profile
    '/root/.config/powershell/Microsoft.VSCode_profile.ps1'
)
$Profiles.ForEach{ New-Item -Path $_ -ItemType File -Force }


Write-Host "configuring alias for terraform"
$Profiles.ForEach{ $p = $_; New-Alias "tf" "terraform" -ErrorAction SilentlyContinue | Out-File -FilePath $p }

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module 'InvokeBuild', 'PSFramework', 'AWS.Tools.Installer', 'Set-PSEnv','PSScriptAnalyzer' -Confirm:$false -Force
Install-Module PSReadline -Confirm:$false -AllowPrerelease -Force
Install-Module EditorServicesCommandSuite -Scope CurrentUser -AllowPrerelease -Force


$ProfileContent = Get-Content ./profile.ps1 -Raw
$Profiles.ForEach{ $p = $_; $ProfileContent | Out-File $p -Force }