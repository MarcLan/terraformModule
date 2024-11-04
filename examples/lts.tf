module "lts" {
  source = "../01-lts"  # Update the path accordingly

  lts_configurations = [
    {
      group_name  = "example-log-group-1"
      ttl_in_days = 7
      tags        = { environment = "production", department = "IT" }
      region      = "ap-southeast-2"

      streams = [
        {
          stream_name           = "example-log-stream-1a"
          ttl_in_days           = 7
          enterprise_project_id = "enterprise-project-id-1"
          tags                  = { application = "app1" }
          region                = "ap-southeast-2"
        },
        {
          stream_name = "example-log-stream-1b"
          # Optional attributes can be omitted
        }
      ]
    },
    {
      group_name  = "example-log-group-2"
      ttl_in_days = 14

      streams = [
        {
          stream_name = "example-log-stream-2a"
          ttl_in_days = 14
        },
        {
          stream_name = "example-log-stream-2b"
        }
      ]
    }
  ]
}
