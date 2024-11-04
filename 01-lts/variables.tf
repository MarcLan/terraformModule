variable "lts_configurations" {
  description = "List of LTS log groups with their corresponding streams configurations"
  type = list(object({

    # Attributes for huaweicloud_lts_group

    group_name  = string                # Required, ForceNew: Yes - The name of the log group.
    ttl_in_days = number                # Required - Log expiration time in days (1-365).
    tags        = optional(map(string)) # Optional - Key/value pairs for the log group.
    region      = optional(string)      # Optional, ForceNew: Yes - Region to create the log group.

    streams = list(object({

      # Attributes for huaweicloud_lts_stream

      stream_name           = string                # Required, ForceNew: Yes - The name of the log stream.
      ttl_in_days           = optional(number)      # Optional, ForceNew: Yes - Log expiration time in days (1-365).
      enterprise_project_id = optional(string)      # Optional, ForceNew: Yes - Enterprise project ID.
      tags                  = optional(map(string)) # Optional - Key/value pairs for the log stream.
      region                = optional(string)      # Optional, ForceNew: Yes - Region to create the log stream.

    }))
  }))

  # Validation to ensure unique group names
  validation {
    condition     = length(distinct([for group in var.lts_configurations : group.group_name])) == length(var.lts_configurations)
    error_message = "All group names must be unique when using 'group_ids_by_name'."
  }

  # Validation to ensure unique stream names
  validation {
    condition = length(distinct(flatten([
      for group in var.lts_configurations : [
        for stream in group.streams : stream.stream_name
      ]
      ]))) == length(flatten([
      for group in var.lts_configurations : [
        for stream in group.streams : stream.stream_name
      ]
    ]))
    error_message = "All stream names must be unique when using 'stream_ids_by_name'."
  }
}
