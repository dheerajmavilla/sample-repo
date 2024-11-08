#tf workload identity

locals {
  organization_name = "abc"
}

# create a workload identity pool for HCP Terraform - Represents a collection of external workload identities
resource "google_iam_workload_identity_pool" "hcp-tf-pool" {
  project                   = var.project_id
  workload_identity_pool_id = "hcp-tf-pool"
  display_name              = "HCP Terraform Pool"
  description               = "Used to authenticate to Google Cloud"
  disabled                  = false
}
 
# create a workload identity pool provider for HCP Terraform - configuration for an external identity provider
resource "google_iam_workload_identity_pool_provider" "hcp-tf-pool-provider" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.hcp-tf-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "hcp-tf-provider"
  display_name                       = "HCP Terraform Provider"
  description                        = "Used to authenticate to Google Cloud"
  attribute_condition                = "assertion.terraform_organization_name==\"${local.organization_name}\""
  attribute_mapping = {
    "google.subject"                     = "assertion.sub"
    "attribute.terraform_workspace_id"   = "assertion.terraform_workspace_id"
    "attribute.terraform_full_workspace" = "assertion.terraform_full_workspace"
    "attribute.terraform_workspace_name" = "assertion.terraform_workspace_name"
  }
  oidc {
    issuer_uri = "https://app.terraform.io"
  }
}

output "google_iam_workload_identity_pool_provider_tf_name" {
  description = "Workload Identity Pood Provider ID"
  value       = google_iam_workload_identity_pool_provider.hcp-tf-pool-provider.name
}
