output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "oidc_url" {
  value = local.oidc_url
}

output "oidc_arn" {
  value = local.oidc_arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_ca_cert" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
