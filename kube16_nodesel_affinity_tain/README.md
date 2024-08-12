- Добавьте всем нодам в кластере label usercase=workload.

oc get nodes
oc label node .... 'usercase=workload'
oc get nodes -l usercase=workload

- Добавьте на одну ноду taint dedicated=true NoSchedule.

kubectl taint node ...... dedicated=true:NoSchedule

- Создайте deployment dp-label, который будет запускать поды на нодах с label usercase=workload, и укажите количество реплик — 5 штук.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: dp-label
spec:
  replicas: 5
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      nodeSelector:
        usercase: workload
      containers:
        - name: httpd
          image: httpd


- Создайте deployment dp-taint, который будет запускать поды на нодах с label usercase=workload, и toleration, который удовлетворяет условию dedicated=true.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: dp-taint
spec:
  replicas: 2
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      nodeSelector:
        usercase: workload
      tolerations:
      - key: "dedicated"
        operator: "Equal"
        value: "true"
        effect: "NoSchedule"
      containers:
        - name: httpd
          image: httpd
