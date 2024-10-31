######################################################################
# Access Key and Secret Key
######################################################################
variable "access_key" {
  description = "The access key variable" # Required: Access key for authentication with the cloud provider
  sensitive   = true                      # Indicates that this variable should not be displayed in logs
}

variable "secret_key" {
  description = "The secret key variable" # Required: Secret key for authentication with the cloud provider
  sensitive   = true                      # Indicates that this variable should not be displayed in logs
}