resource "terraform_data" "update-eks-context" {
  depends_on = [module.eks_cluster]

  triggers_replace = timestamp()

  provisioner "local-exec" {
    command     = "${path.root}/scripts/update-eks-context.sh"
    interpreter = ["/bin/bash", "-c"]

    environment = {
      CLUSTER_NAME = "${var.project_name}-cluster"
      REGION       = var.aws_region
    }
  }
}
