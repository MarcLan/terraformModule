# ######################################################################
# # An example of creating KMS
# ######################################################################

# module "kms" {
#   source = "../02-kms"  # Path to the KMS module

#   kms_keys = {
#     "kms-key-1" = {
#       key_alias                = "my-kms-key-1"
#       region                   = "ap-southeast-1"
#       key_algorithm            = "AES_256"
#       key_usage                = "ENCRYPT_DECRYPT"
#       key_description          = "This is my first KMS key."
#       origin                   = "kms"
#       enterprise_project_id    = "default"
#       keystore_id              = null
#       tags                     = {
#         Environment = "production"
#         Team        = "devops"
#       }
#       is_enabled               = true
#       rotation_enabled         = false
#       rotation_interval        = 365
#       pending_days             = 30
#     }

#     "kms-key-2" = {
#       key_alias                = "my-kms-key-2"
#       region                   = "ap-southeast-1"
#       key_algorithm            = "RSA_2048"
#       key_usage                = "SIGN_VERIFY"
#       key_description          = "This is my second KMS key."
#       origin                   = "kms"
#       enterprise_project_id    = "default"
#       keystore_id              = null
#       tags                     = {
#         Environment = "staging"
#         Team        = "backend"
#       }
#       is_enabled               = true
#       rotation_enabled         = true
#       rotation_interval        = 30
#       pending_days             = 7
#     }
#   }
# }

# output "kms_key_ids" {
#   value = module.kms.kms_key_ids  # Outputs the KMS key IDs created
# }
