resource "kubernetes_namespace" "petclinic" {
  metadata {
    name = "petclinic"
  }
}

resource "helm_release" "petclinic" {
  name      = "petclinic"
  chart     = "${path.module}/../helm/petclinic"
  namespace = "petclinic"
  depends_on = [kubernetes_namespace.petclinic]

  values = [
    "${file("values.petclinic.yaml")}"
  ]

  set {
    name  = "image.repository"
    value = var.petclinic_image_repo
  }

  set {
    name  = "image.tag"
    value = var.petclinic_image_tag
  }
}
