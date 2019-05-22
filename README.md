# kube-security
Set of opensource/free tools/configurations that can help you keep your Kubernetes secured

## microscanner
A a free image scanner that can find OS vulnerabilities in your images.

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
And then running a regular "docer build".

Alternatively, you can scan an image that is already created using the following project:
[microscanner-wrapper](https://github.com/lukebond/microscanner-wrapper) 
