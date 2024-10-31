######################################################################
# Specify the version of terraform and provider
######################################################################
terraform {
  required_version = ">= 1.0.0"  # Specifies the minimum required Terraform version.

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"  # Specifies the source for the Huawei Cloud provider.
      version = "~> 1.30"  # Allows for any version that is compatible with 1.30.x but less than 2.0.0.
    }
  }
}