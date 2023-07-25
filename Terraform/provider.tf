#it allows to authenticate with k8s and it provides the resources to use helm charts
#here i am using minitube
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}