module "iam_assumable_role_cluster_autoscaler" {
  source       = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version      = "~> v2.14.0"
  create_role  = true
  role_name    = "${local.base_name}-${random_string.lower.result}"
  provider_url = replace(var.eks_cluster_oidc_issuer_url, "https://", "")
  role_policy_arns = [
    aws_iam_policy.cluster_autoscaler.arn
  ]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.namespace}:${local.cluster_autoscaler_service_account_name}"]
}
