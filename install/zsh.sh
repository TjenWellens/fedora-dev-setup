# ZSH
sudo dnf install zsh -y

echo "Configuring Oh My ZSH"
{ # your 'try' block
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
} || { # your 'catch' block
    echo 'Oh My Zsh like to exit for some reasons so this prevents it'
}

# Configure ZSH  plugins
echo "Configuring ZSH plugins"
{
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    sed -i 's/plugins=(git)/plugins=(\n  git\n)/g' ~/.zshrc
    sed -i 's/git$/git\'$'\n  zsh-autosuggestions/g' ~/.zshrc
    sed -i 's/zsh-autosuggestions$/zsh-autosuggestions\'$'\n  zsh-syntax-highlighting/g' ~/.zshrc
} || {
    echo 'Failed to configure zsh plugins'
}