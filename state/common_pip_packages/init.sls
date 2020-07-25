cookiecutter:
  pip.installed:
    - user: {{ grains['BI_USER_NAME'] }}
    - upgrade: True

bump2version:
  pip.installed:
    - user: {{ grains['BI_USER_NAME'] }}
    - upgrade: True
