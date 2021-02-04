#!/usr/bin/env sh

USERNAME=${1:-"node"}

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root.'
    exit 1
fi

if ! id -u ${USERNAME} > /dev/null 2>&1; then
    echo -e 'User ${USERNAME} not exists.'
    exit 1
fi

if ! type zsh > /dev/null 2>&1; then
    echo -e 'Shell zsh not installed.'
    exit 1
fi

su -c "$(cat << 'EOF'
    set -e
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "export PROMPT=[Docker]\$PROMPT" >> ~/.zshrc
EOF
)" - ${USERNAME} 2>&1

echo "Done!"