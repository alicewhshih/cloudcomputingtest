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

resource "google_compute_instance" "vm_instance" {
  name = "student-vm"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config { # Enables external access (optional)
    }
  }
}

output "vm_external_ip" {
    value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}