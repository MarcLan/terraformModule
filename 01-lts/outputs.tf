######################################################################
# Output group id and stream id
#####################################################################
# Output the IDs of created log groups
output "log_group_ids" {
  description = "Map of log group names to their IDs."
  value = {
    for group_key, group_value in huaweicloud_lts_group.this :
    group_key => group_value.id  # Map the log group name to its ID
  }
}

# Output the IDs of created log streams
output "log_stream_ids" {
  description = "Map of log stream names to their IDs."
  value = {
    for stream_key, stream_value in huaweicloud_lts_stream.this :
    stream_key => stream_value.id  # Map the log stream name to its ID
  }
}

