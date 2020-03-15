now := "$(shell date +%Y-%m-%d_%H:%M:%S)"
pwd := "$(shell pwd)"
user := "$(shell whoami)"
id := "$(shell id -u $(shell whoami))"
git_email := "$(shell git config user.email)"
git_username := "$(shell git config user.name)"

ifneq (,$(wildcard .env))
include .env
endif

info:
	@echo "now: ${now}"
	@echo "pwd: ${pwd}"
	@echo "user: ${user}"
	@echo "id: ${id}"
	@echo "git_email: ${git_email}"
	@echo "git_username: ${git_username}"

build: info
	docker build -t cne-dev-setup \
	--build-arg force_jx_rebuild=${now} \
	--build-arg user=${user} \
	--build-arg id=${id} \
	--build-arg git_email=${git_email} \
	--build-arg git_username=${git_username} \
	./fedora-dev-setup

check-env:
	test -n "PROJECT_ID" -a -n "$(PROJECT_ID)"
	test -n "CLUSTER_NAME" -a -n "$(CLUSTER_NAME)"
	test -n "ZONE" -a -n "$(ZONE)"

run: check-env
	docker run --rm -it \
	-v "${pwd}:/home/${user}/cne" \
	-v "${HOME}/.config/gcloud/application_default_credentials.json:/root/.config/gcloud/application_default_credentials.json" \
	-e PROJECT_ID=${PROJECT_ID} \
	-e CLUSTER_NAME=${CLUSTER_NAME} \
	-e ZONE=${ZONE} \
	-w /home/${user}/cne \
	cne-dev-setup /bin/zsh
