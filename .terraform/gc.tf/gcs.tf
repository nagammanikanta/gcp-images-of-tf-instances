resource "google_storage_bucket" "static-bucket" {
  name          = "static-bucket"
  location      = "us-central1-b"
  force_destroy = true

  uniform_bucket_level_access = true

}