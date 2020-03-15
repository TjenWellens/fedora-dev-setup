# terraform
mkdir ~/Downloads
curl -L https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip --output ~/Downloads/terraform.zip
unzip ~/Downloads/terraform.zip -d ~/Downloads/terraform/
chmod +x ~/Downloads/terraform/terraform
sudo mv ~/Downloads/terraform/terraform /usr/bin/terraform