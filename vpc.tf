

resource "google_compute_network" "custom-vpc-tf" {
  name = var.custom-vpc-tf
  auto_create_subnetworks = false
}
 resource "google_compute_subnetwork" "subnet-tf" {
   name          = var.subnet-tf
   network = google_compute_network.custom-vpc-tf.id
   ip_cidr_range = var.ip_cidr_range
   region        = var.region
   
  
  }



