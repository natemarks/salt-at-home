This state installs packages for  the workstation user like:

```bash
pip install --user cookiecutter
```

These pip-installed packages are ONLY meant for packages that are external to projects:
 - **cookiecutter** It's used to create new project directory structures from project templates. It's run before a project exists so it can't be in a project.
 - **bump2version** could be in the project environment, but I use it to manage semver strings in non-python projects, too. So I install it at the user level. You'll also find it in my project requirements.txt files.
  
These packages should be distinct from packages used by python projects which should be installed in the pyenv/venv  or pyenv/pipenv virtual environment for the project.  When in doubt, install a package in a project environment using requirements.txt.
