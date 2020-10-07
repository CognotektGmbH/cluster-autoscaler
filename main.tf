resource "random_string" "lower" {
  length  = 16
  upper   = false
  lower   = true
  number  = false
  special = false
}

resource "helm_release" "cluster_autoscaler" {
  name       = local.base_name
  chart      = var.chart
  namespace  = var.namespace
  repository = var.chart_repository
  version    = var.chart_version


  values = [
    templatefile("${path.module}/files/values.tmpl", {node_selectors=var.node_selectors})
  ]

  set {
    type = "string"
    name  = "autoDiscovery.clusterName"
    value = var.cluster_id
  }

  set {
    type = "string"
    name  = "rbac.serviceAccount.name"
    value = local.cluster_autoscaler_service_account_name
  }

  // set_string {
  //   name  = "rbac.serviceAccountAnnotations.eks\\.amazonaws\\.com/role-arn"
  //   value = module.iam_assumable_role_cluster_autoscaler.this_iam_role_arn
  // }
}
