# Terraform LTS Module

## Overview

This Terraform module manages Huawei Cloud Log Tank Service (LTS) log groups and log streams. It simplifies the creation and management of logging resources, allowing users to configure log retention and tagging easily.

## Requirements

- **Terraform**: >= 1.0.0
- **Providers**: Huawei Cloud provider (huaweicloud)

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
module "lts" {
  source      = "./modules/lts"  # Path to the LTS module

  log_groups  = {
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

```

## Input Variables

### `log_groups`
- **Description**: Map of log group names to their configurations.
- **Required**: Yes

| Key          | Type                      | Description                              |
|--------------|---------------------------|------------------------------------------|
| group_name   | `string`                  | The name of the log group.               |
| region       | `optional(string)`        | The region for the log group (optional). |
| ttl_in_days  | `number`                  | Expiration time for logs (1-365 days).  |
| tags         | `optional(map(string))`   | Tags to associate with the log group (optional). |

### `log_streams`
- **Description**: Map of log stream names to their configurations.
- **Required**: Yes

| Key                      | Type                      | Description                              |
|-------------------------|---------------------------|------------------------------------------|
| group_name              | `string`                  | The name of the log group this stream belongs to. |
| stream_name             | `string`                  | The name of the log stream.              |
| region                  | `optional(string)`        | The region for the log stream (optional). |
| ttl_in_days             | `number`                  | Expiration time for the stream (1-365 days). |
| enterprise_project_id   | `optional(string)`        | The enterprise project ID (optional).    |
| tags                    | `optional(map(string))`   | Tags to associate with the log stream (optional). |

# Outputs

### `log_group_ids`
- **Description**: Map of log group names to their IDs.

### `log_stream_ids`
- **Description**: Map of log stream names to their IDs.
