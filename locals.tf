locals {
  account_id                              = data.aws_caller_identity.current.account_id
  base_name                               = "${var.cluster_id}-${var.name}"
  cluster_autoscaler_service_account_name = local.base_name
  tags = merge(var.tags,
    {
      Module    = "cluster-autoscaler"
      Terraform = "true"
    }
  )
}
