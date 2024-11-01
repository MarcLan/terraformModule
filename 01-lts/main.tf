###################################################################### 
# Main configuration for creating LTS log groups and streams in the module
###################################################################### 

# Create Log Groups
resource "huaweicloud_lts_group" "this" {
  for_each = { for group in var.log_groups : group.group_name => group }  # Use group name as key

  group_name  = each.value.group_name  # Set the name of the log group.
  region      = lookup(each.value, "region", null)  # Use provider-level region if not specified.
  ttl_in_days = each.value.ttl_in_days  # Set the log expiration time.
  tags        = each.value.tags  # Attach any tags to the log group.
}

# Create Log Streams
resource "huaweicloud_lts_stream" "this" {
  for_each = { for stream in var.log_streams : stream.stream_name => stream }  # Use stream name as key

  group_id              = huaweicloud_lts_group.this[each.value.group_name].id  # Link the stream to its log group by name.
  stream_name           = each.value.stream_name  # Set the name of the log stream.
  ttl_in_days           = each.value.ttl_in_days  # Set the log expiration time for the stream.
  tags                  = each.value.tags  # Attach any tags to the log stream.
  region                = lookup(each.value, "region", huaweicloud_lts_group.this[each.value.group_name].region)  # Inherit region from the log group if not specified.
  enterprise_project_id = lookup(each.value, "enterprise_project_id", null)  # Set the enterprise project ID if provided.
}
