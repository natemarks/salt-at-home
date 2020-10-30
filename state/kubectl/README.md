There doesn't seem to be a kubernetes focal repo yet:

SO I replaced:

```yaml
kubectl.repo:
  pkgrepo.managed:
    - name: "deb http://apt.kubernetes.io/ kubernetes-{{ salt['grains.get']('oscodename')}} main"
    - humanname: Kubectl Repo
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - gpgcheck: 1
```

with 
```yaml

kubectl.repo:
  pkgrepo.managed:
    - name: "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    - humanname: Kubectl Repo
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - gpgcheck: 1

```

to force "focal" to "xenial"