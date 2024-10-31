######################################################################
# The LTS variables
######################################################################
# Define the input variable for log groups
variable "log_groups" {
  description = "Map of log group names to their configurations."
  type = map(object({
    group_name             = string  # The name of the log group
    region                 = optional(string)  # The region for the log group (optional)
    ttl_in_days            = number  # The expiration time for logs (1-365 days)
    tags                   = optional(map(string))  # Tags to associate with the log group (optional)
  }))
}

# Define the input variable for log streams
variable "log_streams" {
  description = "Map of log stream names to their configurations."
  type = map(object({
    group_name              = string  # The name of the log group this stream belongs to
    stream_name             = string  # The name of the log stream
    region                  = optional(string)  # The region for the log stream (optional)
    ttl_in_days             = number  # The expiration time for the log stream (1-365 days)
    enterprise_project_id   = optional(string)  # The enterprise project ID (optional)
    tags                    = optional(map(string))  # Tags to associate with the log stream (optional)
  }))
}
