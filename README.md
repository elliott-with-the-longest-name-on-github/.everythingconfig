# Execute the following commands in order.

_Note: I recommend running the scripts before installing the applications, if possible._

```bash
# Create symlinks for .config files
ln -s ~/src/repos/.everythingconfig/.gitconfig ~/.gitconfig
ln -s ~/src/repos/.everythingconfig/.bashrc ~/.bashrc

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

# Install VSCode - I recommend downloading .deb from VSCode site
sudo dpkg -i ~/Downloads/DOWNLOADED_FILE_NAME.deb

# Install node
sudo apt install npm

# Install yarn
sudo npm install -g yarn

# Install Azure Functions Core Tools (make sure deb version is correct)
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install azure-functions-core-tools-3
```
