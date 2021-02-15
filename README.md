# .everythingconfig

All my all my configurations in one place, ready to install on any Ubuntu-based system.
Like the setup and want to make it your own? Fork it! All I ask is that if you find ways to automate some of these things, you PR them into my repo so I can take advantage of them as well! :)

# Execute the following commands in order.

_Note: I recommend running the scripts before installing the applications, if possible._

```bash
export EVERYTHINGCONFIG_HOMEPATH="$HOME"
export EVERYTHINGCONFIG_REPOPATH="$HOME/src/repos/.everythingconfig"
export EVERYTHINGCONFIG_DOWNLOADPATH="$HOME/Downloads"

# Create a local git file to hold device-specific stuff (like GPG key IDs)
touch "$EVERYTHINGCONFIG_REPOPATH/.localgit"
printf "[user]\n    signingKey = GPGKEYHERE" >> "$EVERYTHINGCONFIG_REPOPATH/.localgit"


# Generate a ssh key for the device
ssh-keygen -t ed25519 -C "sejohnson@torchcloudconsulting.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy that key and add it to GitHub
sudo apt-get install xclip
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
# Now add it to GitHub (probably a way to api-ize this, but I'm too busy)

# Generate a GPG key for the device
sudo apt-get install gnupg
gpg --full-generate-key
# Follow through instructions, then find your key's ID:
gpg --list-secret-keys --keyid-format LONG
# Remember to add the Key ID to .localgit
gpg --armor --export KEY_ID | xclip -selection c
# Add the clipboarded text as a GPG key in GitHub

# Create symlinks for .config files
ln -sf "$EVERYTHINGCONFIG_REPOPATH/.gitconfig" "$EVERYTHINGCONFIG_HOMEPATH/.gitconfig"
ln -sf "$EVERYTHINGCONFIG_REPOPATH/.bashrc" "$EVERYTHINGCONFIG_HOMEPATH/.bashrc"
ln -sf "$EVERYTHINGCONFIG_REPOPATH/.vscode" "$EVERYTHINGCONFIG_HOMEPATH/.config/Code/User/settings.json"
ln -sf "$EVERYTHINGCONFIG_REPOPATH/.linux-profile" "$EVERYTHINGCONFIG_HOMEPATH/.profile"

# Install VSCode - I recommend downloading .deb from VSCode site
sudo dpkg -i "$EVERYTHINGCONFIG_DOWNLOADPATH/DOWNLOADED_FILE_NAME.deb"

# Install Kite
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

# Install node
# Start by installing nvm from [here](https://github.com/creationix/nvm)
nvm install node

# Install yarn
npm install -g yarn

# Install Azure Functions Core Tools (make sure deb version is correct)
wget -q --directory-prefix=$EVERYTHINGCONFIG_DOWNLOADPATH https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i "$EVERYTHINGCONFIG_DOWNLOADPATH/packages-microsoft-prod.deb"
sudo apt-get update
sudo apt-get install azure-functions-core-tools-3

# Install golang: [download](https://golang.org/doc/install) - may have to update file name if version has changed
sudo tar -C /usr/local -xzf ~/Downloads/go1.15.8.linux-amd64.tar.gz

# Install .NET Runtime and .NET 5.0 and 3.1 SDKs
wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O "$EVERYTHINGCONFIG_DOWNLOADPATH/packages-microsoft-prod.deb"
sudo dpkg -i "$EVERYTHINGCONFIG_DOWNLOADPATH/packages-microsoft-prod.deb"
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-5.0
sudo apt-get install -y dotnet-sdk-3.1

# Install Slack (if you really need to...): https://slack.com/downloads/linux
sudo dpkg -i "$EVERYTHINGCONFIG_DOWNLOADPATH/SLACKFILE.deb"

# Install Teams (if you REALLY need to...): 
sudo dpkg -i "$EVERYTHINGCONFIG_DOWNLOADPATH/TEAMSFILE.deb"
```
