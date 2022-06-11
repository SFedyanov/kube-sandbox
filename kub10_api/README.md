# Examples

```bash
curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem https://api.okd13.sandbox.kryptodev.ru:6443
curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem https://api.okd13.sandbox.kryptodev.ru:6443/api/v1/nodes | head -50
curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem https://api.okd13.sandbox.kryptodev.ru:6443/apis/apps/v1/deployments | head -50
curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem https://api.okd13.sandbox.kryptodev.ru:6443/api/v1/pods | head -50 
```

# Own API
API apiregistration.k8s.io/v1


```yaml
apiVersion: apiregistration.k8s.io/v1
kind: APIService
metadata:
  name: <name of the registration object>
spec:
  group: <API group name this extension apiserver hosts>
  version: <API version this extension apiserver hosts>
  groupPriorityMinimum: <priority this APIService for this group, see API documentation>
  versionPriority: <prioritizes ordering of this version within a group, see API documentation>
  service:
    namespace: <namespace of the extension apiserver service>
    name: <name of the extension apiserver service>
  caBundle: <pem encoded ca cert that signs the server cert used by the webhook>
```

```bash
oc get apiservices
oc get apiservices v1beta1.metrics.k8s.io -o yaml 
```

# TASK
cat inventory/local/artifacts/admin.conf

```bash
echo 'LS0...' | base64 -d > ~/.kube/ca.pem
echo 'LS0...' | base64 -d > ~/.kube/user.pem
echo 'LS0...' | base64 -d > ~/.kube/user-key.pem
```

~/work/kube_sandbox/kub10_api/op.json

~/op.json

```json
[ { "op": "add", "path": "/metadata/labels/api", "value": "true" } ]
```

```bash
curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem --request PATCH --data "$(cat ~/work/kube_sandbox/kub10_api/op.json)" -H "Content-Type:application/json-patch+json" https://api.okd13.sandbox.kryptodev.ru:6443/api/v1/namespaces/kube-sandbox/pods/connection-checker-66569d98bc-2qkmv


kubectl run nginx --image nginx

curl -D - -s --cacert ~/.kube/ca.pem --cert  ~/.kube/user.pem --key  ~/.kube/user-key.pem --request PATCH --data "$(cat ~/op.json)" -H "Content-Type:application/json-patch+json" https://165.22.195.111:6443/api/v1/namespaces/default/pods/nginx


```