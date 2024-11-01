######################################################################
# An example of creating LTS
######################################################################
module "lts" {
  source = "../01-lts" # Path to the LTS module
  log_groups = [
    {
      group_name  = "group-1"
      ttl_in_days = "30"
    },
    {
      group_name  = "group-2"
      ttl_in_days = "30"
    }
  ]

  log_streams = [
    {
      group_name  = "group-1"
      stream_name = "stream-1-1"
      ttl_in_days = "30"
    },
    {
      group_name  = "group-1"
      stream_name = "stream-1-2"
      ttl_in_days = "30"
    },
    {
      group_name  = "group-2"
      stream_name = "stream-2-1"
      ttl_in_days = "30"
    },
    {
      group_name  = "group-2"
      stream_name = "stream-2-2"
      ttl_in_days = "30"
    },
  ]

}
