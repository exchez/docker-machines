#!/bin/bash

#su -c "tmux new-session -d -s mlflow"
#su -c "tmux send -t mlflow \"mlflow ui --host 0.0.0.0\" ENTER"

su -c "tmux new-session -d -s lab"
su -c "tmux send -t lab \"jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser\" ENTER"

/bin/bash