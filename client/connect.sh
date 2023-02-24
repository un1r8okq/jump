#!/bin/bash

JUMP_USERNAME=camera-pi
JUMP_HOSTNAME=localhost
JUMP_PORT=2222
JUMP_LISTEN_PORT=43022

ssh-keygen -P "" -t ed25519 -f id_ed25519
scp -P $JUMP_PORT id_ed25519 $JUMP_USERNAME@$JUMP_HOSTNAME:/home/$JUMP_USERNAME/.ssh/id_ed25519
rm id_ed25519 id_ed25519.pub
cat id_ed25519.pub >> ~/.ssh/authorized_keys
ssh -p $JUMP_PORT -R $JUMP_LISTEN_PORT:$JUMP_HOSTNAME:22 $JUMP_USERNAME@$JUMP_HOSTNAME
