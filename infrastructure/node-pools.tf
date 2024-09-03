# resource "google_service_account" "k8s" {
#   account_id = var.service_account_id
# }

resource "google_container_node_pool" "general" {
  name       = "general-${var.node_pool_name}"
  cluster    = google_container_cluster.this.id
  node_count = var.node_pool_count
  management {
    auto_repair  = var.node_pool_auto_repair
    auto_upgrade = var.node_pool_auto_upgrade
  }
  node_config {
    preemptible  = var.node_pool_preemtible
    machine_type = var.node_pool_machine_size
    labels = var.general_node_pool_label
    service_account = data.google_service_account.this.email
    oauth_scopes = var.node_pool_oauth_scope
  }

}

resource "google_container_node_pool" "spot" {
  name    = "spot-${var.node_pool_name}"
  cluster = google_container_cluster.this.id
 
  management {
    auto_repair  = var.node_pool_auto_repair
    auto_upgrade = var.node_pool_auto_upgrade
  }
  autoscaling {
    min_node_count = var.node_pool_min
    max_node_count = var.node_pool_max
  }
  node_config {
    preemptible  = var.node_pool_preemtible
    machine_type = var.node_pool_machine_size
    labels = var.spot_node_pool_label
    taint {
      key    = var.node_pool_taint_key
      value  = var.node_pool_taint_value
      effect = var.node_pool_taint_effect
    }
    service_account = data.google_service_account.this.email
    oauth_scopes =var.node_pool_oauth_scope
  }

}