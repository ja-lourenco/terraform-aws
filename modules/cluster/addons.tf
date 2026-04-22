resource "aws_eks_addon" "eks_vpc_cni" {
  cluster_name = aws_eks_cluster.eks_cluster.id
  addon_name   = "vpc-cni"

  service_account_role_arn = aws_iam_role.eks_vpc_cni_role.arn

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  tags = var.tags

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}
