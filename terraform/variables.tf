variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  default     = "petclinic"
  description = "Kubernetes cluster name"
}

variable "petclinic_image_repo" {
  default = "bagratte/petclinic"
  description = "Petclinic Docker image repository"
}

variable "petclinic_image_tag" {
    default = "latest"
    description = "Petclinic Docker image tag"
}
