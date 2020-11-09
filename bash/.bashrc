# Adapted from flowbok's tutorial on shell startup order
# This file gets run in two cases:
# 1. non-login interactive shell
# 2. remote shell (over ssh or similar, ie "ssh user@host bash")
#   In this case, /etc/bash.bashrc has not been previous executed (unlike #1).
#   TODO: What does that ^ mean and why does flowblok say that "we assume there
#   is a recovery mode"...

. $HOME/dotfiles/bash/env
. $HOME/dotfiles/bash/interactive

