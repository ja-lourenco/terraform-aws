locals {
  oidc_url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  oidc_arn = aws_iam_openid_connect_provider.eks_oidc.arn
}
