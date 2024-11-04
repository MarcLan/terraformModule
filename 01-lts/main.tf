# Create LTS Log Groups
resource "huaweicloud_lts_group" "log_groups" {
  for_each = { for group in var.lts_configurations : group.group_name => group }

  group_name  = each.value.group_name
  ttl_in_days = each.value.ttl_in_days
  tags        = lookup(each.value, "tags", null)
  region      = lookup(each.value, "region", null)
}

# Local Variable to Flatten Streams
locals {
  group_stream_pairs = flatten([
    for group in var.lts_configurations : [
      for stream in group.streams : {
        group_name  = group.group_name
        stream_name = stream.stream_name
        stream_key  = "${group.group_name}.${stream.stream_name}"
        stream_data = stream
      }
    ]
  ])
}

# Create LTS Log Streams
resource "huaweicloud_lts_stream" "log_streams" {
  for_each = { for pair in local.group_stream_pairs : pair.stream_key => pair }

  group_id              = huaweicloud_lts_group.log_groups[each.value.group_name].id
  stream_name           = each.value.stream_name
  ttl_in_days           = lookup(each.value.stream_data, "ttl_in_days", null)
  enterprise_project_id = lookup(each.value.stream_data, "enterprise_project_id", null)
  tags                  = lookup(each.value.stream_data, "tags", null)
  region                = lookup(each.value.stream_data, "region", null)
}
