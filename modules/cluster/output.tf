output "eks_oidc" {
  value = aws_eks_cluster.eks_cluster.identity
}
