# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb && sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
RUN sudo apt-get install -y powershell
# Start PowerShell
