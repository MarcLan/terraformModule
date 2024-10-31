###################################################################### 
# Outputs for the KMS keys created in the module
###################################################################### 

output "kms_key_ids" {
  description = "Map of KMS key aliases to their IDs."
  value = {
    for key_alias, resource in huaweicloud_kms_key.this :
    key_alias => resource.id  # Map the KMS key alias to its ID.
  }
}
