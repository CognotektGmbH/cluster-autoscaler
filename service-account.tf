resource "kubernetes_service_account" "cluster_autoscaler" {
  metadata {
    name      = local.cluster_autoscaler_service_account_name
    namespace = var.namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = module.iam_assumable_role_cluster_autoscaler.this_iam_role_arn
    }
    labels = local.tags
  }
  automount_service_account_token = true
}
