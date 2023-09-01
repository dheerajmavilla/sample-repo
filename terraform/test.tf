resource "google_cloud_run_service" "keypointers-extraction-app-eu" {
  name     = "keypointers-extraction-app-eu"
  location = "europe-west4"
  project  = var.project_id
  traffic {
    percent         = 100
    latest_revision = true
  }
  template {
    spec {
      container_concurrency = "10"
      service_account_name  = "key-pointers-app-gpt3@spotdraft-qa.iam.gserviceaccount.com"
      containers {
        image = "asia-docker.pkg.dev/spotdraft-qa/sd-qa-asia/mr-ping/keypointers_extraction:main_20230522_122450_0f63bd5"
      }
    }
  }
}
