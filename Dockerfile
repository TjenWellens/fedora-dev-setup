FROM fedora:31

ARG user
RUN test -n "$user"

ARG id
RUN test -n "$id"

ARG git_email
RUN test -n "$git_email"

ARG git_username
RUN test -n "$git_username"

RUN useradd -u ${id} -G wheel ${user}

# don't need to type password for sudo
RUN echo -e "" >> /etc/sudoers
RUN echo -e "## User should not need password for sudo" >> /etc/sudoers
RUN echo -e "${user}\tALL=(ALL)\tNOPASSWD: ALL" >> /etc/sudoers
RUN echo -e "" >> /etc/sudoers

# workaround for error
RUN echo -e "" >> /etc/sudo.conf
RUN echo -e "## Workaround for error" >> /etc/sudo.conf
RUN echo -e "## https://ask.fedoraproject.org/t/sudo-setrlimit-rlimit-core-operation-not-permitted/4223" >> /etc/sudo.conf
RUN echo -e "Set disable_coredump false" >> /etc/sudo.conf
RUN echo -e "" >> /etc/sudo.conf

USER ${user}
WORKDIR /home/${user}

RUN echo "email: ${email}"
RUN echo "username: ${username}"

COPY install/git.sh ./install/git.sh
RUN ./install/git.sh

COPY install/fedora-workstation.sh ./install/fedora-workstation.sh
RUN ./install/fedora-workstation.sh

COPY install/zsh.sh ./install/zsh.sh
RUN ./install/zsh.sh

COPY install/snap.sh ./install/snap.sh
RUN ./install/snap.sh

COPY install/development-tools.sh ./install/development-tools.sh
RUN ./install/development-tools.sh

COPY install/node.sh ./install/node.sh
RUN ./install/node.sh

COPY install/jq.sh ./install/jq.sh
RUN ./install/jq.sh

COPY install/kubectl.sh ./install/kubectl.sh
RUN ./install/kubectl.sh

COPY install/gcloud.sh ./install/gcloud.sh
RUN ./install/gcloud.sh

COPY install/terraform.sh ./install/terraform.sh
RUN ./install/terraform.sh


COPY install/redhat.sh ./install/redhat.sh
RUN ./install/redhat.sh

COPY install/helm.sh ./install/helm.sh
RUN ./install/helm.sh

COPY connect-to-cluster.sh .

# allow invalidate cache for this step
ARG force_jx_rebuild
RUN test -n "$force_jx_rebuild"

COPY install/jx.sh ./install/jx.sh
RUN ./install/jx.sh
