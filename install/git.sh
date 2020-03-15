# Install git
sudo dnf install git -y

# Configure Git
echo "Configuring Git"
echo "user.email $git_email"
echo "user.name $git_username"
git config --global --replace-all user.email "$git_email"
git config --global --replace-all user.name "$git_username"

ssh-keygen -t rsa -b 4096 -C "$git_email"
eval "$(ssh-agent -s)"
