###################################################################### 
# Outputs for the LTS keys created in the module
###################################################################### 

output "log_group_ids" {
  description = "Map of log group names to their IDs."
  value = {
    for group in huaweicloud_lts_group.this :
    group.group_name => group.id  # Map the log group name to its ID.
  }
}

output "log_stream_ids" {
  description = "Map of log stream names to their IDs."
  value = {
    for stream in huaweicloud_lts_stream.this :
    stream.stream_name => stream.id  # Map the stream name to its ID.
  }
}
