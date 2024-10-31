######################################################################
# Get the terrform version and Huawei provider
######################################################################
terraform {
  required_version = ">1.3.0" # Ensures the Terraform version is greater than 1.3.0.
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud" # Huawei Cloud provider source.
      version = ">1.60.0" # Requires Huawei Cloud provider version greater than 1.60.0.
    }
  }
}

provider "huaweicloud" {
  region     = "ap-southeast-2" # The region is set to Bangkok.
  access_key = var.access_key    # Access key for authentication.
  secret_key = var.secret_key    # Secret key for authentication.

  # assume_role {
  #   agency_name = "terraformRole"        # Agency role name to assume.
  #   domain_name = "hwc-awc-core-network" # Domain name for the agency role.
  # }
}