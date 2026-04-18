#resource "aws_eks_node_group" "example" {
#  cluster_name    = aws_eks_cluster.eks_cluster.name
#  node_group_name = "${var.project_name}-nodegroup"
#  node_role_arn   = aws_iam_role.eks_mng_role.arn
#  subnet_ids = [
#    var.subnet_private_1a,
#    var.subnet_private_1b
#  ]
#
#  scaling_config {
#    desired_size = 1
#    max_size     = 1
#    min_size     = 1
#  }
#
#  update_config {
#    max_unavailable = 1
#  }
#
#  depends_on = [
#    aws_iam_role_policy_attachment.eks_cluster_role_attachment_worker,
#    aws_iam_role_policy_attachment.eks_cluster_role_attachment_ecr
#  ]
#}
