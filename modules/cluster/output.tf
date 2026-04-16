output "oidc_url" {
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  description = "EKS Cluster OIDC URL"
}

output "oidc_arn" {
  value       = aws_iam_openid_connect_provider.eks_oidc.arn
  description = "EKS Cluster OIDC ARN"
}
