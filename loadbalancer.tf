resource "google_compute_network" "custom-vpc-tf" {
  name = var.custom-vpc-tf
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-tf" {
  

  name          = var.subnet-tf
  network       = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  purpose       = "PRIVATE_NAT"
}

resource "google_compute_router" "router-tf" {


  name     = "my-router"
  region   = google_compute_subnetwork.subnet-tf.region
  network  = google_compute_network.custom-vpc-tf.id
}

resource "google_network_connectivity_hub" "hub-tf" {
  

  name        = var.hub-tf
 
}

resource "google_network_connectivity_spoke" "spoke-tf" {
  

  name        = "my-spoke"
  location    = "global"
  
  hub         =  google_network_connectivity_hub.hub-tf.id
  linked_vpc_network {
    exclude_export_ranges = [
      "198.51.100.0/24",
      "10.10.0.0/16"
    ]
    uri = google_compute_network.custom-vpc-tf.self_link
  }
}

resource "google_compute_router_nat" "nat_type" {
  provider                            = google-beta

  name                                = "my-router-nat"
  router                              = google_compute_router.router-tf.name
  region                              = google_compute_router.router-tf.region
  source_subnetwork_ip_ranges_to_nat  = "LIST_OF_SUBNETWORKS"
  enable_dynamic_port_allocation      = false
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 32
  type                                = "PRIVATE"
  subnetwork {
    name                    = google_compute_subnetwork.subnet-tf.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  rules {
    rule_number = 100
    description = "rule for private nat"
    match       = "nexthop.hub == \"//networkconnectivity.googleapis.com/projects/leafy-summer-405104/locations/global/hubs/my-hub-tf\""
    action {
      source_nat_active_ranges = [
        google_compute_subnetwork.subnet-tf.self_link
      ]
    }
  }
}