/*
resource "google_compute_firewall" "firewall-terra" {
  name    = var.firewall-terra
  network = google_compute_network.custom-vpc-tf.id


  allow {
    protocol = "tcp"


    ports = ["80", "8080", "1000-2000", "443"]
  }

  source_tags = var.source_tags
}
*/


