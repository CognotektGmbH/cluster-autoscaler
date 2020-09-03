# EKS Cluster ID (Name)
variable "cluster_id" {
  type = string
}

# EKS Cluster OIDC Issuer URL
variable "eks_cluster_oidc_issuer_url" {
  type = string
}

# EKS Namespace
variable "namespace" {
  type    = string
  default = "ops-autoscaler"
}

# Name to be used accross all resources (Helm managed, IAM policy, IRSA Role, among others)
variable "name" {
  type    = string
  default = "cluster-autoscaler"
}

# Chart details
variable "chart" {
  type    = string
  default = "cluster-autoscaler"
}

variable "chart_repository" {
  type    = string
  default = "stable"
}

variable "chart_version" {
  type    = string
  default = "7.3.4"
}

# Resource tagging
variable "tags" {
  type    = map(string)
  default = {}
}

# Sets up both nodeselectors and tolerations
variable "node_selectors" {
  type = list(string)
  default = []
}

