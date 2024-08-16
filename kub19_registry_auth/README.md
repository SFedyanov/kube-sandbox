
```bash
kubectl create secret generic regcred --from-file=.dockerconfigjson=<path/to/.docker/config.json> --type=kubernetes.io/dockerconfigjson

kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>
```

```yaml
kind: Pod
metadata:
  name: private-reg
spec:
  containers:
  - name: private-reg-container
    image: <your-private-image>
  imagePullSecrets:
  - name: regcred
```

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: default
  namespace: default
imagePullSecrets:
- name: myregistrykey
```


```bash
oc create secret --help
oc create secret docker-registry --help
oc edit sa default
```

```bash
kubectl create secret docker-registry regcred --docker-server=https://hub.docker.com --docker-username=sfedyanov --docker-password=123 --docker-email=sfedyanov@gmail.com
kubectl edit sa default
```
