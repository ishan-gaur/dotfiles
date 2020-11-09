# Adapted from flowbok's tutorial on shell startup order
# 1. Ensure we setup env first
. $HOME/dotfiles/bash/env

# 2. Prevent it from being run later, since we need to use $BASH_ENV for
# non-login non-interactive shells.
# We don't export it, as we may have a non-login non-interactive shell as
# a child.
BASH_ENV=

# 3. Since only login shells are here though:
. $HOME/dotfiles/bash/login

# 4. If interactive, finally find the corresponding settings
if [ "$PS1" ]; then
    . $HOME/dotfiles/bash/interactive
fi
