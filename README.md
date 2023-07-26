# Argocd

- ArgoCD is a declarative, GitOps continuous delivery tool that can be used to automate the deployment of Kubernetes applications.
- It is built on top of Kubernetes.
- It uses a declarative GitOps approach to deployment, which means that you define your desired state in Git and ArgoCD will automatically deploy and manage your applications to match that state.
- ArgoCD can be used to deploy applications to a variety of Kubernetes clusters, including on-premises, in the cloud, and in hybrid environments.
- It is a powerful tool that can help you to automate and simplify the deployment and management of your Kubernetes applications.


- Deployed directly in the K8s cluster and its an extension of k8s API
- uses existing K8s functionality and it uses etcd to store data
- uses k8s controllers for monitoring and comparing actual and desired state 

# Docker
- To login  **docker login --username dineshd**
- Pull all the images  **docker pull nginx:1.23.3**
- Copy the existing image to your username **docker tag nginx:1.23.3 dineshd/nginx:v0.1.0**
- push the image  **docker push dineshd/nginx:v0.1.0**

# Helm and Other cmds
- Helm charts are a popular way to package and deploy Kubernetes applications.(To install open source projects to your k8s cluster now a days we use Helm charts.)
- to see the argocd installed successfully 
  - **helm list -A**
- Make sure all the pods are running 
  - **Kubectl get pods  -n(namespace)  argocd**
- To get the secrets 
  - **kubectl get secrets -n argocd**
- To open the secrets file 
  - **kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd**
- To decode the pwd 
  - **echo "" | base64 -d**
- To run the argocd ui 
  - **kubectl port-forward svc/argocd-server -n argocd 8080:80**
- First sync 
  - **kubectl apply -f .\example\application.yaml** and then commit those new images
- to see the pods in local after we synced manually in argocd 
  - **kubectl get pods -n dev**
- When you delete ArgoCD, the resources it created are deleted, but the Kubernetes resources are not. To delete both, you need to add the finalizer to the ArgoCD YAML file. This will first delete the Kubernetes resources and then remove them from the ArgoCD state.
  - **kubectl delete -f example/application.yaml**

# upgrade(bash file)
- When the CI pipeline runs, it automatically generates Docker images, updates to the newer image version, and makes the corresponding version changes in the YAML file. These changes will trigger ArgoCD to initiate the deployment process."


# deploy multiple components
- it allows us to deploy multiple components for different envs.

# Helm Metrics Server
- Add  **helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/**
- search that metrics server  that you added **helm search repo metrics-server**
- save the default values **helm show values metrics-server/metrics-server --version 3.10.0 > metrics-server-defaults.yaml**