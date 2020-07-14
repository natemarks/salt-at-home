include:
  - common_packages

/etc/bashrc.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/etc/zshrc.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/etc/bashrc.d/autojump.sh:
  file.symlink:
    - target: /usr/share/autojump/autojump.sh
    - force: True
    - require:
      - required_packages
