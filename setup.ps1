$EVERYTHINGCONFIG_HOMEPATH = "$HOME"
$EVERYTHINGCONFIG_REPOPATH = "$HOME\src\repos\.everythingconfig"

$GIT_EMAIL = "sejohnson@torchcloudconsulting.com"

choco install git -y

# Create a local git file to hold device-specific stuff (like GPG key IDs)
$LOCALGIT_PATH = "$EVERYTHINGCONFIG_REPOPATH\.localgit"
touch "$LOCALGIT_PATH"
"[user]\n    signingKey = GPGKEYHERE" > "$LOCALGIT_PATH"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

ssh-keygen -t ed25519 -C "$GIT_EMAIL"
Set-Service ssh-agent -StartupType Manual
$SSH_FILE = "$HOME\.ssh\id_ed25519.pub"
ssh-add "$SSH_FILE"
Get-Content $SSH_FILE | Set-Clipboard

Read-Host "SSH Key is on the clipboard. Put it in GitHub at https://github.com/settings/keys. Done? (Y/n)"

# Note: Deprecated VSCode link because VSCode settings sync works well.
New-Item -ItemType SymbolicLink -Path "$EVERYTHINGCONFIG_HOMEPATH/.gitconfig" -Target "$EVERYTHINGCONFIG_REPOPATH/.gitconfig" -Force 

# VSCode
choco install vscode -y

# Node
choco install nodejs -y

# Yarn
npm install -g yarn

# Azure Functions Core Tools
choco install azure-functions-core-cools -y

# .NET Runtimes
choco install dotnet-6.0-runtime -y
choco install dotnet-5.0-runtime -y
choco install dotnetcore-runtime -y

# Golang
choco install go -y

$WANT_ADS = Read-Host "Do you want Azure Data Studio? (Y/n)"
if ($WANT_ADS -eq "Y") {
  # Azure Data Studio
  choco install azure-data-studio -y
}

$WANT_POSTMAN = Read-Host "Do you want Postman? (Y/n)"
if ($WANT_POSTMAN -eq "Y") {
  # Postman
  choco install postman -y
}

$WANT_VS = Read-Host "Do you want Visual Studio Community Edition? (Y/n)"
if ($WANT_VS -eq "Y") {
  # VS
  choco install visualstudio2022community -y
}

$WANT_RIDER = Read-Host "Do you want JetBrains Rider? (Y/n)"
if ($WANT_RIDER -eq "Y") {
  # JetBrains Rider
  choco install jetbrains-rider -y 
}

$WANT_GOLAND = Read-Host "Do you want JetBrains Goland? (Y/n)"
if ($WANT_GOLAND -eq "Y") {
  # JetBrains Goland
  choco install jetbrains-goland -y
}

$WANT_TEAMS = Read-Host "Do you want Microsoft Teams? (Y/n)"
if ($WANT_TEAMS -eq "Y") {
  choco install microsoft-teams -y
}

$WANT_SLACK = Read-Host "Do you want Slack? (Y/n)"
if ($WANT_SLACK -eq "Y") {
  choco install slack -y
}