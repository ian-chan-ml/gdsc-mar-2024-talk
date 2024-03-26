project_id = "gdsc-mar-2024"
region     = "asia-southeast1"
zone       = "asia-southeast1-b"

num_instances = 1
subnetwork    = "projects/gdsc-mar-2024/regions/asia-southeast1/subnetworks/default"

service_account = {
  email  = "511059952885-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
}
