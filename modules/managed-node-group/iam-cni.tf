locals {
  # Removes the 'https://' from the beginning of oidc url
  oidc_url_formatted = replace(var.oidc_url, "https://", "")
}

resource "aws_iam_role" "eks_vpc_cni_role" {
  name = "${var.project_name}-vpc-cni-role"

  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Principal : {
          Federated : var.oidc_arn
        },
        Action : "sts:AssumeRoleWithWebIdentity",
        Condition : {
          StringEquals : {
            "${local.oidc_url_formatted}:aud" : "sts.amazonaws.com",
            "${local.oidc_url_formatted}:sub" : "system:serviceaccount:kube-system:aws-node"
          }
        }
      }
    ]
  })

  tags = merge(var.tags, { Name = "${var.project_name}-vpc-cni-role" })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_role_attachment_vpc_cni" {
  role       = aws_iam_role.eks_vpc_cni_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
