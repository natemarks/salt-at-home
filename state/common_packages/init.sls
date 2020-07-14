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
    - require:
      - remove_unwanted_packages
