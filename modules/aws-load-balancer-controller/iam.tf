locals {
  # Removes the 'https://' from the beginning of oidc url
  oidc_url_formatted = replace(var.oidc_url, "https://", "")
}

resource "aws_iam_role" "eks_controller_role" {
  name = "${var.project_name}-aws-load-balancer-controller"

  assume_role_policy = templatefile("${path.module}/alb-trust-policy.json.tftpl", {
    oidc_arn = var.oidc_arn
    oidc_url = local.oidc_url_formatted
  })

  tags = merge(var.tags, { Name = "${var.project_name}-aws-load-balancer-controller-role" })
}

resource "aws_iam_role_policy_attachment" "eks_controller_role_attachment" {
  role       = aws_iam_role.eks_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}
