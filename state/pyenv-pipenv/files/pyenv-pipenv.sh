# pyenv shim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# pipenv configuration
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# let's pipenv use pyenv automagically
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
