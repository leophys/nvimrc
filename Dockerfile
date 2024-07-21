FROM archlinux

ARG UID 1000
ARG GID 1000

RUN groupadd -g ${GID} nvim \
    && useradd -g nvim -u ${UID} -m nvim \
 && pacman -Sy --noconfirm \
    neovim \
    luarocks \
    git \
    zsh \
    bat \
    ripgrep \
    curl \
    openssl \
    nodejs \
    python \
    rustup \
    go \
    clang \
    lua

USER nvim

RUN rustup default stable

ENTRYPOINT ["/usr/bin/nvim"]
CMD []
