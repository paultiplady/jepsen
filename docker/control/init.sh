#!/bin/sh


if [ ! -f ~/.ssh/known_hosts ]; then
    echo > ~/.ssh/known_hosts
    # Get nodes list
#    sort -V /var/jepsen/shared/nodes > ~/nodes
    echo "node-0" > ~/nodes
    # Scan SSH keys
    # TODO: Can we do this ahead of time? Just use our known secret?
    while read node; do
      ssh-keyscan -t rsa $node >> ~/.ssh/known_hosts
      ssh-keyscan -t ed25519 $node >> ~/.ssh/known_hosts
    done <~/nodes
fi

# TODO: assert that SSH_PRIVATE_KEY==~/.ssh/id_rsa

cat <<EOF
Welcome to Jepsen on Docker
===========================

Please run \`bin/console\` in another terminal to proceed.
EOF

# hack for keep this container running
tail -f /dev/null
