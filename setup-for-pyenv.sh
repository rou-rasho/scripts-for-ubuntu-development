#!/bin/bash
git clone https://github.com/anyenv/anyenv ~/.anyenv
.anyenv/bin/anyenv init
anyenv install --init
anyenv install pyenv

mkdir -p $HOME/.local/bin
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(anyenv init -)"' >> $HOME/.bashrc

read -r -d '' VAR <<- EOM
  . $HOME/.bashrc;
  PYTHON_VERSION="3.8.10";
  pyenv install ${PYTHON_VERSION};
  pyenv global ${PYTHON_VERSION};
  ln -s $HOME/.anyenv/envs/pyenv/shims/pip $HOME/.local/bin/pip;
  ln -s $HOME/.anyenv/envs/pyenv/shims/python $HOME/.local/bin/python;
EOM

bash --rcfile <(echo $VAR)
