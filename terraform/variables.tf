variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  default     = "petclinic"
  description = "Kubernetes cluster name"
}

variable "email" {
  default     = "bagratte@live.com"
  description = "Email address to register with Let's Encrypt."
}

variable "petclinic_image_repo" {
  default = "bagratte/petclinic"
  description = "Petclinic Docker image repository"
}

variable "petclinic_image_tag" {
    default = "latest"
    description = "Petclinic Docker image tag"
}
