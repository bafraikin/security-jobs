minikube start
while ! kubectl api-resources --context minikube > /dev/null 2>&1 && kubectl api-versions --context minikube > /dev/null 2>&1; do
  echo 'Waiting kubernetes to be available...'
  sleep 1
done
kubectl apply -f log4shell/
