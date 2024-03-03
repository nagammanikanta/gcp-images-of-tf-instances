/*
// Forwarding rule for External Network Load Balancing using Backend Services
resource "google_compute_forwarding_rule" "forwarding-tf" {

  name            = var.forwarding-tf
  region          = var.region
  port_range      = var.port_range
  backend_service = google_compute_region_backend_service.backend-tf.id
}
resource "google_compute_region_backend_service" "backend-tf" {

  name                  = var.backend-tf
  load_balancing_scheme = var.load_balancing_scheme
  health_checks         = [google_compute_region_health_check.hc-tf.id]
}
resource "google_compute_region_health_check" "hc-tf" {

  name               = var.hc-tf
  check_interval_sec = 1
  timeout_sec        = 1
  region             = var.region

  tcp_health_check {
    port = "80"
  }
}
*/
