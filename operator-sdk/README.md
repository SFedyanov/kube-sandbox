## podset-operator
- https://developers.redhat.com/courses/openshift-operators/go-operator
```bash
$ # oc login -u admin -p admin https://api.crc.testing:6443 --insecure-skip-tls-verify=true
$ oc new-project myproject
$ mkdir -p podset-operator
$ cd podset-operator
$ operator-sdk init --domain=example.com --repo=github.com/redhat/podset-operator
$ ls -lh
##
$ operator-sdk create api --group=app --version=v1alpha1 --kind=PodSet --resource --controller
##
$ cat api/v1alpha1/podset_types.go
# https://github.com/kubernetes-sigs/controller-tools
# https://book.kubebuilder.io/reference/markers.html
# edit api/v1alpha1/podset_types.go
$ make generate
$ make manifests
$ cat config/crd/bases/app.example.com_podsets.yaml
$ oc apply -f config/crd/bases/app.example.com_podsets.yaml
$ oc get crd podsets.app.example.com -o yaml
##
$ cat controllers/podset_controller.go
$ go mod tidy
##
$ MATCH_NAMESPACE=myproject KUBECONFIG=~/.kube/config make run
$ cat config/samples/app_v1alpha1_podset.yaml
$ oc project myproject
$ oc create -f config/samples/app_v1alpha1_podset.yaml
$ oc get podset
$ oc get pods
$ oc get podset podset-sample -o yaml
$ oc patch podset podset-sample --type='json' -p '[{"op": "replace", "path": "/spec/replicas", "value":5}]'
$ oc get pods
```