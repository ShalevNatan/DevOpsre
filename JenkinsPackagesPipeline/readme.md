# Info:
***This pipeline will handle your jenkins deployment packages configuration***
**Above you can see the following files:**
### Dockerfile:
this Dockerfile built "FROM" the base image of jenkins/jenkins:lts and we use it to build our improved Jenkins deployment
### Jenkinsfile:
this file is contains our PaaC of jenkins that we'll run
It will do the following things:
**1.)** Build our Dockerfile 
**2.)** Push the Dockerfile to our Dockerhub repo
**3.)** Updates deployment.yaml in branch "jenkins"

step number 3 will trigger the argoCD part that will synchronize our local deployment of jenkins

In the end of the pipeline we will have an updated jenkins deployment with wanted packages

# Activation and Triggering:
to trigger pipeline update and add the package you need in the Dockerfile, commit the change and the Pipeline will handle the rest..
