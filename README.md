

# fedora-dev-setup
Docker image for your dev setup

I strongly encourage forking!

### Fyi: intended folder structure
```
#intended folder stucture

<my-project-dir>
├── infrastructure
|   └── ...
├── fedora-dev-setup
|   └── ...
├── jenkins-x-boot-config
|   └── ...
├── node-quickstart
|   └── ...
├── ...
|   └── ...
├── connect-to-cluster.sh -> fedora-dev-setup/connect-to-cluster.sh
├── Makefile -> fedora-dev-setup/Makefile
├── .env
└── ...
```
Don't forget to replace `<my-project-...>`

### Prep
```
cd <my-project-dir>

###############################################
## create docker for terraform, JX and stuff ##
###############################################
# get fedora-dev-setup docker-image
git clone git@github.com:TjenWellens/fedora-dev-setup.git

# have makefile available in <my-project-dir>
ln -s ./fedora-dev-setup/Makefile ./

# build docker image
make build


###########################################
## expected environmental variables file ##
###########################################
touch .env
echo "## gcloud projects list" >> .env
echo "PROJECT_ID=<my-project-id>" >> .env
echo "" >> .env
echo "## gcloud container clusters list" >> .env
echo "CLUSTER_NAME=<my-project-cluster>" >> .env
echo "ZONE=<my-project-zone>" >> .env
echo "" >> .env
```
Don't forget to replace `<my-project-...>`

### How to run
```
############################################
## run docker for terraform, JX and stuff ##
############################################
# makes this available in the dockerimage at the working dir (so you don't need to look for it)
ln -s ./fedora-dev-setup/connect-to-cluster.sh ./

make run


# <inside docker>
./connect-to-cluster.sh
```
Don't forget to replace `<my-project-...>`

# Development Setup

The following tools will be installed/configured

* snap
* development-tools
* fedora-workstation
* gcloud
* git
* zsh
* helm
* terraform
* jq
* jx
* kubectl
* node
* redhat
