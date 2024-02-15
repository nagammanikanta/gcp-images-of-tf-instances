

resource "google_compute_router" "router-tf" {


  name    = var.router-tf
  region  = var.region
  network = google_compute_network.custom-vpc-tf.id
}

resource "google_network_connectivity_hub" "hub-tf" {


  name = var.hub-tf

}

resource "google_network_connectivity_spoke" "spoke-tf" {


  name     = var.spoke-tf
  location = "global"

  hub = google_network_connectivity_hub.hub-tf.id
  linked_vpc_network {
    exclude_export_ranges = [
      "198.51.100.0/24",
      "10.10.0.0/16"
    ]
    uri = google_compute_network.custom-vpc-tf.self_link
  }
}

