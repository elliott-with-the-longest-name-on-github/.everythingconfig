# Execute the following commands in order.

_Note: I recommend running the scripts before installing the applications, if possible._

```bash
export EVERYTHINGCONFIG_HOMEPATH = "~/"
export EVERYTHINGCONFIG_REPOPATH = "~/src/repos/.everythingconfig"

# Generate a ssh key for the device
ssh-keygen -t ed25519 -C "sejohnson@torchcloudconsulting.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy that key and add it to GitHub
sudo apt-get install xclip
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
# Now add it to GitHub (probably a way to api-ize this, but I'm too busy)

# Generate a GPG key for the device
sudo apt-install gnupg
gpg --full-generate-key
# Follow through instructions, then find your key's ID:
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export KEY_ID | xclip -selection c
# Add the clipboarded text as a GPG key in GitHub

# Create symlinks for .config files
ln -sf ~/src/repos/.everythingconfig/.gitconfig ~/.gitconfig
ln -sf ~/src/repos/.everythingconfig/.bashrc ~/.bashrc
ln -sf ~/src/repos/.everythingconfig/.vscode ~/.config/Code/User/settings.json
ln -sf ~/src/repos/.everythingconfig/.linux-profile ~/.profile

# Install VSCode - I recommend downloading .deb from VSCode site
sudo dpkg -i ~/Downloads/DOWNLOADED_FILE_NAME.deb

# Install Kite
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

# Install node
# Start by installing nvm from [here](https://github.com/creationix/nvm)
nvm install node

# Install yarn
sudo npm install -g yarn

# Install Azure Functions Core Tools (make sure deb version is correct)
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install azure-functions-core-tools-3

# Install golang: [download](https://golang.org/doc/install) - may have to update file name if version has changed
sudo tar -C /usr/local -xzf ~/Downloads/go1.15.8.linux-amd64.tar.gz

# Install .NET Runtime and .NET 5.0 and 3.1 SDKs
wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-5.0
sudo apt-get install -y dotnet-sdk-3.1
```
