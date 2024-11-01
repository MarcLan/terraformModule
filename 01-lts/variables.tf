###################################################################### 
# Variables for configuring LTS log groups and streams in the module
###################################################################### 

variable "log_groups" {
  description = "List of LTS log group configurations."
  type = list(object({
    group_name  = string                # Required: The name of the log group.
    ttl_in_days = number                # Required: Expiration time for logs (1-365 days).
    region      = optional(string)      # Optional: The region for the log group.
    tags        = optional(map(string)) # Optional: Tags to associate with the log group.
  }))
}

variable "log_streams" {
  description = "List of LTS log stream configurations."
  type = list(object({
    group_name            = string                # Required: The name of the log group this stream belongs to.
    stream_name           = string                # Required: The name of the log stream.
    ttl_in_days           = number                # Required: Expiration time for the stream (1-365 days).
    region                = optional(string)      # Optional: The region for the log stream.
    enterprise_project_id = optional(string)      # Optional: The enterprise project ID.
    tags                  = optional(map(string)) # Optional: Tags to associate with the log stream.
  }))
}
