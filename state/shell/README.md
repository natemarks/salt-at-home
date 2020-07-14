#  DRAFT: Not sure how I want to handle this

DO help users manage fun, complex shells
DO NOT get in the way

This state puts a bunch of utility scripts for bash and zsh into /etc/bashrc.d and /etc/zshrc.d respectively.

I recommend that users source them from $HOME/.bashrc.local and $HOME/zshrc.local respectively

The scripts in these directories will be safe to run together with something like:

```bash
if [ -d /etc/bashrc.d ]; then
  for i in /etc/bashrc.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
```
