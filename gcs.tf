
resource "google_storage_bucket" "static-bucket" {
  name          = var.static-bucket
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

}