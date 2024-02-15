
resource "google_service_account" "sa_tf" {
  account_id   = var.sa_tf_account_id
  display_name = var.sa_tf_display_name
}

resource "google_compute_instance" "instance_terra" {
  name         = var.instance_terra
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = google_compute_network.custom-vpc-tf.id
    subnetwork = google_compute_subnetwork.subnet-tf.id

    access_config {
      // Ephemeral IP

    }
  }
}



