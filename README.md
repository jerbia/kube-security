# kube-security
Set of opensource/free tools/configurations that can help you keep your Kubernetes secured

## microscanner
A free image scanner that can find OS vulnerabilities in your images.

https://github.com/aquasecurity/microscanner

To start using microscanner you will need to register and get a scan token.
Registration is done by running the following:

```
docker run --rm -it aquasec/microscanner --register <email address>
```
After registration you will get an email with the scan token.

Next step would be to run a scan. This can be done either by adding following lines at the end of your Dockerfile:

```
ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
RUN /microscanner <TOKEN> [--continue-on-failure]
```
And then running a regular ```docer build```.

Alternatively, you can scan an image that is already created using the following project:
[microscanner-wrapper](https://github.com/lukebond/microscanner-wrapper) 

## kube-bench
kube-bench is a Go application that checks whether Kubernetes is deployed securely by running the checks documented in the [CIS Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes/).

https://github.com/aquasecurity/kube-bench

Easiest way to run kube-bench is to run the following Job in your cluster:

```
$ kubectl apply -f kube-bench.yaml
job.batch/kube-bench created

$ kubectl get pods
NAME                      READY   STATUS              RESTARTS   AGE
kube-bench-j76s9   0/1     ContainerCreating   0          3s

# Wait for a few seconds for the job to complete
$ kubectl get pods
NAME                      READY   STATUS      RESTARTS   AGE
kube-bench-j76s9   0/1     Completed   0          11s

# The results are held in the pod's logs
kubectl logs kube-bench-j76s9
[INFO] 1 Master Node Security Configuration
[INFO] 1.1 API Server
...
```

## kube-hunter
Kube-hunter hunts for security weaknesses in Kubernetes clusters. The tool was developed to increase awareness and visibility for security issues in Kubernetes environments. 

https://github.com/aquasecurity/kube-hunter

Easiest way to run kube-hunter is to run the following command on a machine with network access to the cluster:

```
$ docker run -it --rm --network host aquasec/kube-hunter --active
Choose one of the options below:
1. Remote scanning      (scans one or more specific IPs or DNS names)
2. Subnet scanning      (scans subnets on all local network interfaces)
3. IP range scanning    (scans a given IP range)
Your choice: 2
~ Started
~ Discovering Open Kubernetes Services...
|
| Kubelet API (readonly):
|   type: open service
|   service: Kubelet API (readonly)
|_  host: 192.168.65.3:10255
```
