# helm
curl -L https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz --output ~/Downloads/helm.tar
tar -zxvf ~/Downloads/helm.tar -C ~/Downloads/
chmod +x ~/Downloads/linux-amd64/helm
sudo mv ~/Downloads/linux-amd64/helm /usr/local/bin/helm