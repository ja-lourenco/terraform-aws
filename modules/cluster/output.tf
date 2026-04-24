output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "oidc_url" {
  value = local.oidc_url
}

output "oidc_arn" {
  value = local.oidc_arn
}
