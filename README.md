![Lifen](lifen.png)

> Care together

# Security - Challenge

Exploit log4shell and improve the application's security posture.



# Prerequites

* Minikube https://minikube.sigs.k8s.io/docs/start/
* Kubectl https://kubernetes.io/docs/tasks/tools/#kubectl

# Setup

Start the environment with `./start.sh`. This will deploy a vulnerable log4shell container inside the kubernetes cluster.

Start `minikube tunnel` to access the service you already deployed https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel. Get the EXTERNAL-IP using :
```
$ kubectl get service log4shell
NAME        TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)        AGE
log4shell   LoadBalancer   10.104.234.226   10.104.234.226   80:31703/TCP   6m19s
```


You should be able to curl it and get a 404
```
$ curl 10.104.234.226
{"timestamp":"2022-01-10T17:06:01.049+00:00","status":400,"error":"Bad Request","path":"/"}
```

# Step 1 - Pentest

Write a script to exploit log4shell and show that the exploit succeeded. (You can use existing tools like JNDIExploit for this)

# Step 2 - Detection and prevention

Answer these questions :

How could we detect this exploit ?
How could we prevent this exploit from working without fixing the vulnerability ?

# Bonus 1

Execute commands against the mysql database using the log4shell vulnerability.

# Bonus 2

Implement some parts of the detection and prevention advices.


Reference:

https://github.com/christophetd/log4shell-vulnerable-app
