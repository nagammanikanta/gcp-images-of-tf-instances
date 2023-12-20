

resource "google_compute_router" "router-tf" {


  name     = var.router-tf
  region   = google_compute_subnetwork.subnet-tf.region
  network  = google_compute_network.custom-vpc-tf.id
}

resource "google_network_connectivity_hub" "hub-tf" {
  

  name        = var.hub-tf
 
}

resource "google_network_connectivity_spoke" "spoke-tf" {
  

  name        = var.spoke-tf
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

resource "google_compute_router_nat" "nat-tf" {
  provider                            = google-beta
  project =  var.project_id
  
  name                                = var.nat-tf
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