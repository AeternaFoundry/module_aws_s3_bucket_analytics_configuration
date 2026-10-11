output "s3_bucket_analytics_configurations_id" {
  description = "Map of id values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3_bucket_analytics_configurations_bucket" {
  description = "Map of bucket values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
}
output "s3_bucket_analytics_configurations_filter" {
  description = "Map of filter values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "s3_bucket_analytics_configurations_name" {
  description = "Map of name values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "s3_bucket_analytics_configurations_region" {
  description = "Map of region values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "s3_bucket_analytics_configurations_storage_class_analysis" {
  description = "Map of storage_class_analysis values across all s3_bucket_analytics_configurations, keyed the same as var.s3_bucket_analytics_configurations"
  value       = { for k, v in aws_s3_bucket_analytics_configuration.s3_bucket_analytics_configurations : k => one(v.storage_class_analysis) if v.storage_class_analysis != null && length(v.storage_class_analysis) > 0 }
}

