###################################################################### 
# Main configuration for creating KMS keys in the module
###################################################################### 

# Create KMS Key
resource "huaweicloud_kms_key" "this" {
  for_each = var.kms_keys  # Loop through each KMS key defined in the input variable.

  key_alias                = each.value.key_alias               # Set the alias of the KMS key.
  region                   = lookup(each.value, "region", null)  # Set the region.
  key_algorithm            = lookup(each.value, "key_algorithm", "AES_256")  # Set the key generation algorithm.
  key_usage                = lookup(each.value, "key_usage", "ENCRYPT_DECRYPT")  # Set the KMS key usage.
  key_description          = lookup(each.value, "key_description", null)  # Set the description if provided.
  origin                   = lookup(each.value, "origin", "kms")  # Set the source of the KMS key.
  enterprise_project_id    = lookup(each.value, "enterprise_project_id", null)  # Set the enterprise project ID if provided.
  keystore_id              = lookup(each.value, "keystore_id", null)  # Set the keystore ID if provided.
  tags                     = each.value.tags                     # Attach any tags to the KMS key.
  is_enabled               = lookup(each.value, "is_enabled", true)  # Specify if the key is enabled.
  rotation_enabled         = lookup(each.value, "rotation_enabled", false)  # Specify if key rotation is enabled.
  rotation_interval        = lookup(each.value, "rotation_interval", 365)  # Set the rotation interval in days.
  pending_days             = lookup(each.value, "pending_days", 7)  # Set the pending days if specified.
}
