# TODO: clean can only actually correctly restore files to the home directory,
# how can this be expanded to any config?
# Additionally if there was no bash_profile to start, how to keep track of that
# and remove the file?
.PHONY: setup

DOTFILES_DIR=${HOME}/dotfiles
BASH_DIR=${DOTFILES_DIR}/bash
VIM_DIR=${DOTFILES_DIR}/vim
GIT_DIR=${DOTFILES_DIR}/git
OLD_DIR=${DOTFILES_DIR}/old_configs

setup: bash-symlinks utils other-symlinks

utils:
	# build-essential has dpkg tools, g++, gcc, libc, and make
	# sudo apt update && apt install -y build-essential silversearcher-ag vim
	sudo apt update && sudo apt install -y silversearcher-ag vim tmux

${OLD_DIR}:
	mkdir -pv ${OLD_DIR}

move-old: ${OLD_DIR}
	if [ -f ${PATH_TO_CURR}/${NAME} ]; then \
	  mv ${PATH_TO_CURR}/${NAME} ${OLD_DIR}; \
	  echo "Moved ${PATH_TO_CURR}/${NAME} to old_configs"; \
	fi

create-symlink:
	export PATH_TO_CURR=${PATH_TO_OLD}; \
	export NAME=${NAME_OLD}; \
	make move-old; \
	ln -sv ${PATH_TO_NEW}/${NAME_NEW} ${PATH_TO_OLD}/${NAME_OLD}

bash-symlinks:
	export PATH_TO_NEW=${BASH_DIR}; \
	export PATH_TO_OLD=~; \
	export NAME_NEW=bash_profile; \
	export NAME_OLD=.bash_profile; \
	make create-symlink; \
	export NAME_NEW=bashrc; \
	export NAME_OLD=.bashrc; \
	make create-symlink

other-symlinks: vim-symlink git-symlink

vim-symlink:
	export PATH_TO_NEW=${VIM_DIR}; \
	export PATH_TO_OLD=~; \
	export NAME_NEW=vimrc; \
	export NAME_OLD=.vimrc; \
	make create-symlink

git-symlink:
	export PATH_TO_NEW=${GIT_DIR}; \
	export PATH_TO_OLD=~; \
	export NAME_NEW=gitconfig; \
	export NAME_OLD=.gitconfig; \
	make create-symlink

clean:
	-mv -v ${OLD_DIR}/.[!.]* ~
	-mv -v ${OLD_DIR}/* ~
	-rm -rf ${OLD_DIR}
	cp ${VIM_DIR}/og_ubuntu_vimrc ${HOME}/.vimrc
	cp ${BASH_DIR}/ubuntu_bashrc ${HOME}/.bashrc
	git restore ${VIM_DIR}/vimrc
	git restore ${BASH_DIR}/bashrc
