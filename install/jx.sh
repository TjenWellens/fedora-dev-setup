# JX
JX_VERSION="$(curl --silent https://api.github.com/repos/jenkins-x/jx/releases/latest | jq -r '.tag_name')"
echo 2> "installing JX version ${JX_VERSION}"
curl -L "https://github.com/jenkins-x/jx/releases/download/${JX_VERSION}/jx-linux-amd64.tar.gz" | tar xzv "jx"
mkdir -p $HOME/.jx/bin
mv jx $HOME/.jx/bin/
echo "" >> ~/.zshrc
echo "export PATH=$HOME/.jx/bin:$PATH" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "source <(jx completion zsh)" >> ~/.zshrc