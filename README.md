# salt-at-home

Using Saltstack to my tools on my personal Ubuntu 20.04 machine.

```bash
curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -P -x python3
```

 - state/golang: installs go and creates a source file (/etc/skel/bashrc.golang) that must be added to your home directory. I'll automate that part later. upgrade by editing pillar.
 - state/docker-desktop: installs docker engine and docker-compose. upgrade by editing pillar.
 - state/terraform: installs terraform and uses alternatives to put it in the path. upgrade by editing pillar.
 - state/terragrunt: installs terragrunt and uses alternatives to put it in the path. upgrade by editing pillar.
 - state/packer: installs packer and uses alternatives to put it in the path. upgrade by editing pillar.


TODO:
 - work in the bash/zsh completions for tools that offer it.
 - add pipenv/pyenv
 - vim
 - jetbrains-toolbox
 - vscode (snap install)