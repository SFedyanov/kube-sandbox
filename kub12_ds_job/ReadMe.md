# Add labels
kubectl edit node node2
kubectl edit node node3

labels:
  usecase: loadbalancer

# Run DaemonSet

kubectl apply -f daemonset.yaml

# CronJob

kubectl apply -f cronjob.yaml
