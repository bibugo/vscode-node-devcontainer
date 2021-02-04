# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.155.1/containers/alpine/.devcontainer/base.Dockerfile

ARG VARIANT="14-alpine3.12"
FROM node:${VARIANT}

ARG USERNAME=node
ARG USER_UID=501
ARG USER_GID=20
ARG TZ=Asia/Shanghai

COPY scripts/*.sh /tmp/scripts/

RUN apk update \
    && apk add --no-cache \
        ca-certificates \
        tzdata \
        openssh-client \
        shadow \
        sudo \
        wget \
        git \
        zsh \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && groupmod -o -g ${USER_GID} ${USERNAME} \
    && usermod -o -u ${USER_UID} -g ${USER_GID} --shell /bin/zsh ${USERNAME} \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && sh /tmp/scripts/install-oh-my-zsh.sh "${USERNAME}" \
    && rm -rf /tmp/scripts

USER ${USERNAME}