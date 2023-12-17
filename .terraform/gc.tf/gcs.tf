resource "google_storage_bucket" "us-my-bucket" {
  name          = "us-my-bucket"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

}