######################################################################
# An example of creating LTS
######################################################################
module "lts" {
  source = "../01-lts"  # Path to the LTS module

  log_groups = {
    "log-group-1" = {
      group_name   = "log-group-1"
      region       = "ap-southeast-1"
      ttl_in_days  = 30
      tags = {
        "environment" = "production"
        "team"        = "devops"
      }
    }

    "log-group-2" = {
      group_name   = "log-group-2"
      region       = "ap-southeast-2"
      ttl_in_days  = 60
    }
  }

  log_streams = {
    "stream-a1" = {
      group_name             = "log-group-1"
      stream_name            = "stream-a1"
      region                 = "ap-southeast-1"
      ttl_in_days            = 7
      enterprise_project_id   = "e1234567890abcdef"
      tags = {
        "service" = "frontend"
      }
    }

    "stream-a2" = {
      group_name             = "log-group-1"
      stream_name            = "stream-a2"
      ttl_in_days            = 14
    }

    "stream-b1" = {
      group_name             = "log-group-2"
      stream_name            = "stream-b1"
      region                 = "ap-southeast-2"
      ttl_in_days            = 30
      enterprise_project_id   = "e0987654321fedcba"
      tags = {
        "service" = "backend"
      }
    }
  }
}
