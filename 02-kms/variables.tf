###################################################################### 
# Variables for configuring KMS keys in the module
######################################################################

variable "kms_keys" {
  description = "Map of KMS key configurations."
  type = map(object({
    key_alias             = string                # The alias name of the KMS key.
    region                = optional(string)      # The region to create the KMS key.
    key_algorithm         = optional(string)      # The generation algorithm of the KMS key.
    key_usage             = optional(string)      # Specifies the KMS key usage.
    key_description       = optional(string)      # The description of the KMS key.
    origin                = optional(string)      # The source of the KMS key.
    enterprise_project_id = optional(string)      # The enterprise project ID.
    keystore_id           = optional(string)      # The keystore ID to which the KMS key belongs.
    tags                  = optional(map(string)) # Tags to associate with the KMS key.
    is_enabled            = optional(bool)        # Specifies whether the KMS key is enabled.
    rotation_enabled      = optional(bool)        # Specifies whether key rotation is enabled.
    rotation_interval     = optional(number)      # The KMS key rotation period (30 to 365).
    pending_days          = optional(number)      # Number of days before scheduled deletion (7 to 1096).
  }))
}
