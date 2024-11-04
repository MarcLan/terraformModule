# Map of group names to their IDs
output "group_ids_by_name" {
  description = "Map of group names to their IDs"
  value = {
    for group_name, group in huaweicloud_lts_group.log_groups :
    group_name => group.id
  }
}

# Map of stream keys (group_name.stream_name) to their IDs
output "stream_ids_by_name" {
  description = "Map of stream names to their IDs, keyed by group_name.stream_name"
  value = {
    for stream_key, stream in huaweicloud_lts_stream.log_streams :
    stream_key => stream.id
  }
}
