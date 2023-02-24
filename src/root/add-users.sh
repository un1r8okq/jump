#!/bin/bash

USERS=(
    "will:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUGGwEzC97UyP+wTQeQb2mGJJ1XWJFa9/pEY+WwTK5k fantasticbox",
)

for USER in "${USERS[@]}"; {
    # Split string on ":" character https://stackoverflow.com/a/918931
    IFS=':' read -ra USERDATA <<< "$USER"
    USERNAME=${USERDATA[0]}
    PUBLIC_KEY=${USERDATA[1]}

    echo "Adding user $USERNAME"
    useradd --create-home $USERNAME
    mkdir /home/$USERNAME/.ssh
    chmod 700 /home/$USERNAME/.ssh
    echo "$PUBLIC_KEY" > /home/$USERNAME/.ssh/authorized_keys
    chmod 644 /home/$USERNAME/.ssh/authorized_keys
    chown -R $USERNAME:$USERNAME /home/$USERNAME
}
