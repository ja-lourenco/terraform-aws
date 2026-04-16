output "eks_oidc_url" {
  value = module.eks_cluster.oidc_url
}

output "eks_oidc_arn" {
  value = module.eks_cluster.oidc_arn
}
