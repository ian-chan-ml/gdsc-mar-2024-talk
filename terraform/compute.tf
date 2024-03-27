locals {
  startup_script_content = file("${path.module}/startup.sh")
}

resource "google_compute_address" "ip_address" {
  name = "external-ip"
}

module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "~> 11.0"

  region          = var.region
  project_id      = var.project_id
  service_account = var.service_account

  machine_type = "e2-standard-4"
  disk_size_gb = "80"
  disk_type    = "pd-ssd"

  startup_script = local.startup_script_content
  subnetwork     = var.subnetwork
  access_config = [{
    nat_ip       = google_compute_address.ip_address.address
    network_tier = "PREMIUM"
  }]
  tags = ["http-server", "https-server"]

  depends_on = [google_compute_address.ip_address]
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "~> 11.0"

  region            = var.region
  zone              = var.zone
  subnetwork        = var.subnetwork
  num_instances     = var.num_instances
  hostname          = "gdsc-mar-2024"
  instance_template = module.instance_template.self_link
}
