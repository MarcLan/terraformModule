# Terraform KMS Module

## Overview

This Terraform module manages Huawei Cloud Key Management Service (KMS) keys. It simplifies the creation and management of KMS keys, allowing users to configure key properties, rotation, and tagging easily.

## Requirements

- **Terraform**: >= 1.0.0
- **Providers**: Huawei Cloud provider (huaweicloud)

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
module "kms" {
  source = "./modules/kms"  # Path to the KMS module

  kms_keys = {
    "kms-key-1" = {
      key_alias                = "my-kms-key-1"
      region                   = "ap-southeast-1"
      key_algorithm            = "AES_256"
      key_usage                = "ENCRYPT_DECRYPT"
      key_description          = "This is my first KMS key."
      origin                   = "kms"
      enterprise_project_id    = "default"
      keystore_id              = null
      tags                     = {
        Environment = "production"
        Team        = "devops"
      }
      is_enabled               = true
      rotation_enabled         = false
      rotation_interval        = 365
      pending_days             = 30
    }

    "kms-key-2" = {
      key_alias                = "my-kms-key-2"
      region                   = "ap-southeast-1"
      key_algorithm            = "RSA_2048"
      key_usage                = "SIGN_VERIFY"
      key_description          = "This is my second KMS key."
      origin                   = "kms"
      enterprise_project_id    = "default"
      keystore_id              = null
      tags                     = {
        Environment = "staging"
        Team        = "backend"
      }
      is_enabled               = true
      rotation_enabled         = true
      rotation_interval        = 30
      pending_days             = 7
    }
  }
}

output "kms_key_ids" {
  value = module.kms.kms_key_ids  # Outputs the KMS key IDs created
}
```

## Input Variables

### `kms_keys`
- **Description**: Map of KMS key configurations.
- **Required**: Yes

| Key                      | Type                      | Description                              |
|-------------------------|---------------------------|------------------------------------------|
| key_alias                | `string`                  | The alias name of the KMS key.          |
| region                   | `optional(string)`        | The region to create the KMS key (optional). |
| key_algorithm            | `optional(string)`        | The generation algorithm of the KMS key. |
| key_usage                | `optional(string)`        | Specifies the KMS key usage.            |
| key_description          | `optional(string)`        | The description of the KMS key.         |
| origin                   | `optional(string)`        | The source of the KMS key.              |
| enterprise_project_id    | `optional(string)`        | The enterprise project ID (optional).   |
| keystore_id              | `optional(string)`        | The keystore ID to which the KMS key belongs. |
| tags                     | `optional(map(string))`   | Tags to associate with the KMS key (optional). |
| is_enabled               | `optional(bool)`          | Specifies whether the KMS key is enabled. |
| rotation_enabled         | `optional(bool)`          | Specifies whether key rotation is enabled. |
| rotation_interval        | `optional(number)`        | The KMS key rotation period (30 to 365). |
| pending_days             | `optional(number)`        | Number of days before scheduled deletion (7 to 1096). |

## Outputs

### `kms_key_ids`
- **Description**: Map of KMS key aliases to their IDs.
