Jenkins Auto-Update & Persistent Packages Pipeline
Overview
This repository contains the resources and pipeline configuration needed to solve the problem of auto-updating Jenkins deployments and ensuring persistent packages within the Jenkins container, even when pods are recreated. The goal is to automate the process of updating Jenkins with new packages and dependencies (such as AWS CLI) without losing any installed tools, and ensuring that the Jenkins deployment stays up-to-date with the latest Docker image versions.

Problem Statement
Auto-updating Jenkins: We wanted to automate the process of updating our Jenkins deployment with new images whenever changes were made to the Jenkins Dockerfile (e.g., adding or updating packages).
Persistent Packages: We wanted to ensure that any packages (like AWS CLI) installed within Jenkins remain persistent across pod restarts or pod replacements, even if the Jenkins pod is recreated.
The solution involves setting up a CI/CD pipeline that automates the Docker image build, pushes the new image to the registry, and syncs the Jenkins deployment with the latest image using ArgoCD.

Solution Workflow
1. Push Changes to GitHub
Any change to the Dockerfile (e.g., adding a new package) or deployment.yaml (e.g., updating the image tag) will be committed to this repository.
This triggers the Jenkins pipeline that automates the rest of the process.
2. Jenkins CI Pipeline
Trigger: The Jenkins pipeline is triggered automatically when a change is pushed to the GitHub repository.
Build Docker Image: Jenkins builds the Docker image using the updated Dockerfile. The image is tagged with the latest commit hash for versioning.
Push Image to Docker Registry: The built image is pushed to a Docker registry (e.g., Docker Hub or AWS ECR).
Update deployment.yaml: The deployment.yaml is updated with the new image tag and pushed back to the repository.
3. ArgoCD Sync
GitOps Deployment: ArgoCD monitors the repository for changes to deployment.yaml.
Auto-Sync: ArgoCD detects the change in the deployment.yaml and automatically syncs the updated configuration with the Kubernetes cluster.
Jenkins Pod Update: ArgoCD updates the Jenkins pods to use the newly pushed Docker image, ensuring that the Jenkins instance is running with the latest configuration and packages.
4. Persistent Packages
By using the Dockerfile approach to include necessary tools (like AWS CLI), the packages remain persistent within the Docker image itself, meaning no matter how many times the pod is replaced or recreated, the necessary dependencies are always available.
Pipeline Structure
1. Jenkinsfile
The Jenkins pipeline (Jenkinsfile) contains the logic to:

Checkout code from the repository.
Build the Docker image with the latest changes.
Push the Docker image to the configured Docker registry.
Update deployment.yaml with the new Docker image tag and commit the changes back to GitHub.
2. ArgoCD Setup
ArgoCD is configured to monitor the deployment.yaml for changes. Once a new image tag is pushed, ArgoCD automatically detects the change and updates the Jenkins deployment in the Kubernetes cluster.

3. Dockerfile
The Dockerfile extends the jenkins/jenkins:lts image and installs any additional dependencies (e.g., AWS CLI) required for your Jenkins pipeline. This image is used for building and running Jenkins.

