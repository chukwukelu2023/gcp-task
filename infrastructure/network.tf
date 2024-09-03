# resource "google_project_service" "this" {
#   for_each = var.project_service
#   service = each.value
#   disable_dependent_services = true
# }

resource "google_compute_network" "this" {
  name                            = var.compute_network_name
  description = var.compute_network_description
  routing_mode                    = var.compute_network_routing
  auto_create_subnetworks         = var.compute_network_subnets
  mtu                             = var.compute_network_mtu
  delete_default_routes_on_create = var.compute_network_default_routes
  # depends_on = [
  #   google_project_service.this
  # ]
}

resource "google_compute_subnetwork" "this" {
  name                     = var.compute_subnetwork_name
  ip_cidr_range            = var.compute_subnetwork_cidr
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = var.compute_network_ip_google_access
  secondary_ip_range = var.compute_network_secondary_ip

}