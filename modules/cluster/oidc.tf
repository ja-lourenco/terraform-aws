resource "aws_iam_openid_connect_provider" "eks_oidc" {
  url = local.oidc_url

  client_id_list = [
    "sts.amazonaws.com"
  ]

  tags = merge(var.tags, { Name = "${var.project_name}-oidc" })
}
