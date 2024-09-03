resource "google_compute_router" "this" {
  name    = var.compute_router_name
  region  = var.region
  network = google_compute_network.this.id
}

resource "google_compute_router_nat" "this" {
  name                               = var.compute_router_nat_name
  region                             = var.region
  router                             = google_compute_router.this.name
  source_subnetwork_ip_ranges_to_nat = var.compute_router_nat_subnet_ip
  nat_ip_allocate_option             = var.compute_router_nat_ip_allocation
  subnetwork {
    name                    = google_compute_subnetwork.this.id
    source_ip_ranges_to_nat = var.compute_router_nat_source_ip_range
  }
  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = var.compute_address_name
  address_type = var.compute_address_type
  description = var.compute_address_description
  network_tier = var.compute_address_tier
  depends_on   = [google_project_service.this["compute"]]
}

resource "google_compute_firewall" "this" {
  name    = var.compute_firewall_name
  network = google_compute_network.this.name
  allow {
    protocol = var.compute_firewall_protocol
    ports    = var.compute_firewall_ports
  }
  source_ranges = var.compute_firewall_source_range
}