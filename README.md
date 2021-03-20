# jenkins-agent-helm

Openshift Jenkins is by default configured with Maven and Nodejs jenkins slave agent. The code in this repository can be used to configure custom Jenkins slave agent which can execute the helm commands.

Openshift documentation for [Configuring Jenkins images](https://docs.openshift.com/container-platform/4.4/openshift_images/using_images/images-other-jenkins.html) is refered for this.

### Configure a cusom Jenkins Agent for Helm CLI


* Run below command to import jenkins slave base image
``` 
oc import-image origin-jenkins-agent-base:v4.0 quay.io/openshift/origin-jenkins-agent-base:v4.0 --confirm
```

* Create secret "github-secret" for github credentials 

```
 oc create secret generic github-secret --from-literal username=<github-username> --from-literal password=<github-pat>
```

* Create build for generaring a jenkins agent image.

```
oc apply -f agent-config.yaml
```

Once the build is complete it will push an agent image into internal image registry. If jenkins is installed in same namespace or of configured to watch the namespace in which is image is pushed, it will automatically configure the slave agent in Kubernetes configuration of Jenkins.


### Run Sample Jenkins Pipeline to Execute Helm Command

* Create sample Jenkins pipeline

```
oc apply -f pipeline/pipeline-config.yaml
```

* Run the pipeline from Openshift console which will execute the Jenkins file to list the Helm releases in current namespace