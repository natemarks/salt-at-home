include:
  - shell

pyenv-pipenv-packages:
  pkg:
    - installed
    - names:
      - zlib-devel
      - bzip2
      - bzip2-devel
      - readline-devel
      - sqlite
      - sqlite-devel
      - openssl-devel
      - xz
      - xz-devel
      - libffi-devel
      - findutils


pyenv_clone:
  git.latest:
    - name: https://github.com/pyenv/pyenv.git
    - target: /home/{{ grains['BI_USER_NAME'] }}/.pyenv
    - force_reset: True

/home/{{ grains['BI_USER_NAME'] }}/.pyenv:
  file.directory:
    - user: {{ grains['BI_USER_NAME'] }}
    - group: {{ grains['BI_USER_NAME'] }}
    - dir_mode: 755
    - file_mode: 755
    - recurse:
        - user
        - group
        - mode
    - require:
      - git: pyenv_clone

pipenv:
  pip.installed:
    - require:
      - git: pyenv_clone

{% for shell_dir in ["bashrc.d", "zshrc.d"] %}
/etc/{{ shell_dir }}/pyenv-pipenv.sh:
  file.managed:
    - source: salt://pyenv-pipenv/files/pyenv-pipenv.sh
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - /etc/{{ shell_dir }}
      - git: pyenv_clone

{% endfor %}
