## 
```bash
$ # oc login -u admin -p admin https://api.crc.testing:6443 --insecure-skip-tls-verify=true
$ oc new-project myproject
$ mkdir -p podset-operator
$ cd podset-operator
$ operator-sdk init --domain=example.com --repo=github.com/redhat/podset-operator
$ ls -lh
$ operator-sdk create api --group=app --version=v1alpha1 --kind=PodSet --resource --controller
```