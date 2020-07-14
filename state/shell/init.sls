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


{% for shell_dir in ["bashrc.d", "zshrc.d"] %}
/etc/{{ shell_dir }}/autojump.sh:
  file.symlink:
    - target: /usr/share/autojump/autojump.sh
    - force: True
    - require:
      - required_packages
{% endfor %}