output "s3_bucket_name" {
  description = "3anatole"
  value       = aws_s3_bucket.state_bucket.id
}

output "dynamodb_table_name" {
  description = "s8anatoledb"
  value       = aws_dynamodb_table.state_lock_table.id
}
