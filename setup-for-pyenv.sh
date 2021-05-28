#!/bin/bash
PYTHON_VERSION="3.8.10";
sudo apt -y install build-essential
sudo apt -y install git
sudo apt -y install zlib1g-dev
sudo apt -y install libreadline-dev
sudo apt -y install libssl-dev
sudo apt -y install libbz2-dev
sudo apt -y install libffi-dev
sudo apt -y install libsqlite3-dev

git clone https://github.com/anyenv/anyenv $HOME/.anyenv
$HOME/.anyenv/bin/anyenv init
$HOME/.anyenv/bin/anyenv install --init
$HOME/.anyenv/bin/anyenv install pyenv

mkdir -p $HOME/.local/bin
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(anyenv init -)"' >> $HOME/.bashrc

read -r -d '' VAR <<- EOM
  . $HOME/.bashrc;
  pyenv install ${PYTHON_VERSION};
  pyenv global ${PYTHON_VERSION};
  ln -s $HOME/.anyenv/envs/pyenv/shims/pip $HOME/.local/bin/pip;
  ln -s $HOME/.anyenv/envs/pyenv/shims/python $HOME/.local/bin/python;
EOM

bash --rcfile <(echo $VAR)
