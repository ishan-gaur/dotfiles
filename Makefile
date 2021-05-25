# TODO: clean can only actually correctly restore files to the home directory,
# how can this be expanded to any config?
# Additionally if there was no bash_profile to start, how to keep track of that
# and remove the file?
.PHONY = move-old bash-sym clean

dotfiles_dir=${HOME}/dotfiles
bash_dir=${dotfiles_dir}/bash
old_dir=${dotfiles_dir}/old_configs

${old_dir}:
	mkdir -pv ${old_dir}

move-old: ${old_dir}
	if [ -f ${old_path} ]; then \
	  mv ${old_path} ${old_dir}; \
	  echo "Moved ${old_path} to ${old_dir}"; \
	fi

restore-old: curr_path=${old_dir}/${name}
restore-old:
	if [ -d ${old_dir} ] && [ -f ${curr_path} ]; then \
	  mv ${curr_path} ${old_path}; \
	  echo "Moved ${curr_path} to ${old_path}"; \
	fi

bash-sym: old_path=${HOME}/.bashrc 
bash-sym: new_path=${bash_dir}/bashrc
bash-sym: move-old
	ln -sv ${new_path} ${old_path}; \
	echo linked ${old_path} to ${new_path}

clean-bash: old_path=${HOME}/.bashrc 
clean-bash: name=.bashrc # TODO: get this from old_path
clean-bash: restore-old

clean: clean-bash
	rm -rf ${old_dir}
