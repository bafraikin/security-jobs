![Lifen](lifen.png)

> Care together

# Security - Challenge

Exploit log4shell and improve the application's security posture.



# Prerequites

* Minikube https://minikube.sigs.k8s.io/docs/start/
* Kubectl https://kubernetes.io/docs/tasks/tools/#kubectl

# Setup

Start the environment with `./start.sh`. This will deploy a vulnerable log4shell container inside the kubernetes cluster.

Start `minikube tunnel` to access to the vulnerable service you already deployed https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-tunnel. Get the EXTERNAL-IP using :
```$ kubectl get service log4shell

NAME        TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)        AGE
log4shell   LoadBalancer   10.104.234.226   10.104.234.226   80:31703/TCP   6m19s
```

You should be able to curl it and get a 404
```
$ curl 10.104.234.226
{"timestamp":"2022-01-10T17:06:01.049+00:00","status":400,"error":"Bad Request","path":"/"}
```

From inside the log4shell pod you should be able to acceed to the host using `host.minikube.internal` https://minikube.sigs.k8s.io/docs/handbook/host-access/. You can test it with :

```
# start a sample server (or the JNDI exploit)
$ python3 -m http.server
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...


# Get the name of the pod
$ kubectl get pod
NAME                         READY   STATUS    RESTARTS      AGE
log4shell-55dd6dccc5-dtctr   1/1     Running   3 (18m ago)   15h
mysql-55f758b87d-m7pfr       1/1     Running   3 (17m ago)   15h

# Exec inside the pod
$ kubectl exec -it log4shell-55dd6dccc5-dtctr sh
$ # Run wget to ensure you can connect to a host service
$ / # wget host.minikube.internal:8000
Connecting to host.minikube.internal:8000 (192.168.49.1:8000)
wget: can't open 'index.html': File exists

```

I you cannot connect, ensure there is no firewall blocking the connection on your machine from minikube. On linux, if you have ufw, you can autorise connections with: `sudo ufw allow from 192.168.49.0/24` (`minikube ip` should be inside this range).

# Step 1 - Pentest

Write a script to exploit log4shell and show that the exploit succeeded. (You can use existing tools like JNDIExploit for this https://github.com/black9/Log4shell_JNDIExploit)

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
