resource "aws_s3_bucket_analytics_configuration" "s3_bucket_analytics_configurations" {
  for_each = var.s3_bucket_analytics_configurations

  bucket = each.value.bucket
  name   = each.value.name
  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      prefix = filter.value.prefix
      tags   = filter.value.tags
    }
  }

  dynamic "storage_class_analysis" {
    for_each = each.value.storage_class_analysis != null ? [each.value.storage_class_analysis] : []
    content {
      data_export {
        destination {
          s3_bucket_destination {
            bucket_account_id = storage_class_analysis.value.data_export.destination.s3_bucket_destination.bucket_account_id
            bucket_arn        = storage_class_analysis.value.data_export.destination.s3_bucket_destination.bucket_arn
            format            = storage_class_analysis.value.data_export.destination.s3_bucket_destination.format
            prefix            = storage_class_analysis.value.data_export.destination.s3_bucket_destination.prefix
          }
        }
        output_schema_version = storage_class_analysis.value.data_export.output_schema_version
      }
    }
  }
}

