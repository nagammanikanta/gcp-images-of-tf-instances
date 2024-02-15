resource "google_compute_network_peering" "peering1" {
  name         = var.peering1
  network      = google_compute_network.vpc-1.self_link
  peer_network = google_compute_network.vpc-2.self_link

}
resource "google_compute_network_peering" "peering2" {
  name         = var.peering2
  network      = google_compute_network.vpc-2.self_link
  peer_network = google_compute_network.vpc-1.self_link

}



resource "google_compute_network_peering" "peering3" {
  name         = var.peering3
  network      = google_compute_network.vpc-1.self_link
  peer_network = google_compute_network.vpc-3.self_link
}
resource "google_compute_network_peering" "peering4" {
  name         = var.peering4
  network      = google_compute_network.vpc-3.self_link
  peer_network = google_compute_network.vpc-1.self_link
}



resource "google_compute_network" "vpc-1" {
  name                    = var.vpc-1
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_network" "vpc-2" {
  name                    = var.vpc-2
  auto_create_subnetworks = var.auto_create_subnetworks
}
resource "google_compute_network" "vpc-3" {
  name                    = var.vpc-3
  auto_create_subnetworks = var.auto_create_subnetworks
}