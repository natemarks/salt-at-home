remove_unwanted_packages:
  pkg:
    - removed
    - names:
      - vim-tiny

required_packages:
  pkg:
    - installed
    - names:
      - autojump
      - fzf
      - shellcheck
      - vim
      - python3-venv
    - require:
      - remove_unwanted_packages
