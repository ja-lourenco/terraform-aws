variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "oidc_url" {
  type        = string
  description = "OIDC URL from EKS Cluster"
}

variable "oidc_arn" {
  type        = string
  description = "OIDC ARN from EKS Cluster"
}
