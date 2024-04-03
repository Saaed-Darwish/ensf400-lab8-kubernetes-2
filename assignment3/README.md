# Assignment 3 - Steps and Outputs

## Setup

### Start minikube:

If minikube hasn't been started already:

```bash
minikube start --nodes 3 -p ensf400
```
If profile exists - the instance was stopped, you can restart the profile with:

```bash
minikube start -p ensf400
```

### cd Into Assignment3 Folder

Now cd into the assignment3 folder.

```bash
cd ./assignment3
```

Assignment3 folder contains:
- nginx-dep.yaml
- nginx-configmap.yaml
- nginx-svc.yaml
- nginx-ingress.yaml
- app-1-dep.yaml
- app-1-svc.yaml
- app-2-dep.yaml
- app-2-svc.yaml
- app-1-ingress.yaml
- app-2-ingress.yaml
- README.md
- test.sh

### Run the Following to Apply and Deploy

Apply all yaml files with this command to kubectl:
```bash
kubectl apply -f .
```

## Curl

### To curl the Applications

I used the following command to curl the application - as with the lab; the following minikube profile created was ensf400 so I just add the specification here, with an added echo to just print a newline character after the response:
```bash
curl http://$(minikube ip -p ensf400); echo
```

### Responses and Outputs

Here are some curls including their responses and outputs:
```bash
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-2-dep-5887f59cc-nqvjm]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-2-dep-5887f59cc-nqvjm]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
@Saaed-Darwish ➜ /workspaces/ensf400-lab8-kubernetes-2/assignment3 (main) $ curl http://$(minikube ip -p ensf400); echo
Hello World from [app-1-dep-5645659dfd-dw6w5]!
```

### Outputs Meeting the Requirements

To make sure the ingresses are in fact redirecting 70% of the traffic to app-1 and 30% to app-2, I created a simple test.sh script. This curls the applications 100 times (may take about a minute or two) then calculates the percentage from the amount of times app-1 responds and app-2 responds. Here are the results of 5 runs:

1. 
- App1 responses: 75
- App2 responses: 25
- App1 percentage: 75%
- App2 percentage: 25%

2.
- App1 responses: 67
- App2 responses: 33
- App1 percentage: 67%
- App2 percentage: 33%

3.
- App1 responses: 70
- App2 responses: 30
- App1 percentage: 70%
- App2 percentage: 30%

4.
- App1 responses: 77
- App2 responses: 23
- App1 percentage: 77%
- App2 percentage: 23%

5.
- App1 responses: 63
- App2 responses: 37
- App1 percentage: 63%
- App2 percentage: 37%

Running test.sh yourself is easy. You may change the number of requests in test.sh itself as well to increase accuracy - note these take a while to run so I use 100 requests as the default. To run test.sh:
```bash
chmod +x test.sh
```
```bash
./test.sh
```