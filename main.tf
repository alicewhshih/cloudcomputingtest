terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "focused-bridge-451009-u2" # Use your actual project ID
  region = "us-west1"
}

resource "google_storage_bucket" "mybucket" {
  name = "my-terraform-bucket-0975329667whs" # Ensure globally unique
  location = "us-west1"

  versioning {
    enabled = true
    }

  labels = {
    environment = "student-lab"
    managed_by = "terraform"
    }
}

resource "google_storage_bucket_iam_binding" "example_binding" {
  bucket = google_storage_bucket.mybucket.name
  role = "roles/storage.objectUser"

  members = ["user:nicomontenegrob@gmail.com"]
}

output "bucket_name" {
    value = google_storage_bucket.mybucket.name
}