variable "s3_bucket_analytics_configurations" {
  description = <<EOT
Map of s3_bucket_analytics_configurations, attributes below
Required:
    - bucket
    - name
Optional:
    - region
    - filter (block):
        - prefix (optional)
        - tags (optional)
    - storage_class_analysis (block):
        - data_export (required, block):
            - destination (required, block):
                - s3_bucket_destination (required, block):
                    - bucket_account_id (optional)
                    - bucket_arn (required)
                    - format (optional)
                    - prefix (optional)
            - output_schema_version (optional)
EOT

  type = map(object({
    bucket = string
    name   = string
    region = optional(string)
    filter = optional(object({
      prefix = optional(string)
      tags   = optional(map(string))
    }))
    storage_class_analysis = optional(object({
      data_export = object({
        destination = object({
          s3_bucket_destination = object({
            bucket_account_id = optional(string)
            bucket_arn        = string
            format            = optional(string)
            prefix            = optional(string)
          })
        })
        output_schema_version = optional(string)
      })
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

