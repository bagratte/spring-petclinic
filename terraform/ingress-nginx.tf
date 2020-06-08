resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "aws_iam_role_policy" "eks_cluster_ingress_loadbalancer_creation" {
  name   = "eks-cluster-ingress-loadbalancer-creation"
  role   = module.eks.cluster_iam_role_name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeInternetGateways"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "2.3.0"
  namespace  = kubernetes_namespace.ingress-nginx.metadata[0].name
  depends_on = [
    kubernetes_namespace.ingress-nginx,
    aws_iam_role_policy.eks_cluster_ingress_loadbalancer_creation
  ]

  values = [
    "${file("values.ingress-nginx.yaml")}"
  ]
}
