#  DRAFT: Not sure how I want to handle this

DO help users manage fun, complex shells
DO NOT get in the way

This state puts a bunch of utility scripts for bash and zsh into /etc/bashrc.d and /etc/zshrc.d respectively.

I recommend that users source them from $HOME/.bashrc.local and $HOME/zshrc.local respectively


 In my home_directory, I have this in my $HOME/.bashrc.local:
 ```bash
 if [ -d $HOME/bashrc.d ]; then
  for i in $HOME/bashrc.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
 ```

 This way I can control what shell configurations I want by linking:
 ```bash
 ln -s /etc/bashrc.d/autojump.sh $HOME/bashrc.d/autojump.sh
 ```