#metallb namespace metallb-system

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl edit configmap -n kube-system kube-proxy
strictARP: true

#metallb - 10.114.15.0/24
kubectl -n metallb-system apply -f cm.yaml

#httpd-dp -namespace default -image httpd.
kubectl -n default apply -f httpd-dp.yaml

#http-svc-int -namespace default -type ClusterIP
kubectl -n default apply -f clusterip-svc.yaml

#http-svc-ext -namespace default -type LoadBalancer
kubectl apply -f loadbalancer-svc.yaml
