# configmap

oc create configmap appconfig --from-file=config.txt --from-file=config2.txt \
--from-literal=key1=data1 --from-literal=key2=data2

kubectl create configmap nginx-conf -n default --from-file=nginx.conf
kubectl create secret generic nginx-env -n default --from-literal=AUTH=testpassword
