resource "google_container_cluster" "this" {
  name                     = var.container_cluster_name
  location                 = "${var.region}-a" #Zonal Cluster type
  remove_default_node_pool = var.container_cluster_remove_node_pool
  initial_node_count       = var.container_cluster_initial_node_count
  network                  = google_compute_network.this.self_link
  subnetwork               = google_compute_subnetwork.this.self_link
  deletion_protection      = var.container_cluster_deletion_protection
  networking_mode          = var.container_cluster_network_mode
  node_locations           = ["${var.region}-b"]
  addons_config {
    http_load_balancing {
      disabled = var.container_cluster_http_balancing
    }
    horizontal_pod_autoscaling {
      disabled = var.container_cluster_hpa
    }
  }
  release_channel {
    channel = var.container_cluster_release_chanel
  }

  workload_identity_config {
    workload_pool = "${var.project-id}.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.container_cluster_secondary_range
    services_secondary_range_name = var.container_services_secondary_range
  }

  private_cluster_config {
    enable_private_nodes    = var.cluster_enable_private_nodes
    enable_private_endpoint = var.cluster_enable_private_endpoint
    master_ipv4_cidr_block  = var.cluster_master_cidr
  }
}