locals {
  startup_script_content = file("${path.module}/startup.sh")
}

module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "~> 11.0"

  region          = var.region
  project_id      = var.project_id
  service_account = var.service_account

  machine_type = "e2-standard-2"
  disk_size_gb = "80"
  disk_type    = "pd-ssd"

  startup_script = local.startup_script_content
  subnetwork     = var.subnetwork
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "~> 11.0"

  region            = var.region
  zone              = var.zone
  num_instances     = var.num_instances
  hostname          = "gdsc-mar-2024"
  instance_template = module.instance_template.self_link
}

