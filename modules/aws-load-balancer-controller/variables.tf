variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "oidc_url" {
  type        = string
  description = "EKS OIDC provider URL"
}

variable "oidc_arn" {
  type        = string
  description = "EKS OIDC provider arn"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}
