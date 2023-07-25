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

# Helm
- Helm charts are a popular way to package and deploy Kubernetes applications.(To install open source projects to your k8s cluster now a days we use Helm charts.)
- to see the argocd installed successfully **helm list -A**
- Make sure all the pods are running **Kubectl get pods  -n(namespace)  argocd**
- To get the secrets **kubectl get secrets -n argocd**
- To open the secrets file **kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd**
- To decode the pwd **echo "" | base64 -d**
- To run the argocd ui **kubectl port-forward svc/argocd-server -n argocd 8080:80**
- First sync **kubectl apply -f .\example\application.yaml** and then commit those new images
- to see the pods in local after we synced manually in argocd **kubectl get pods -n dev**