# S3 and DynamoDB Terraform Module

This module creates an S3 bucket and a DynamoDB table for storing Terraform state and locking.

## Inputs
- `bucket_name` - s3anatole.
- `dynamodb_table_name` - s8anatoledb.
- `region` - us-east-1 (default: `us-east-1`).

## Outputs
- `s3_bucket_name` - s3anatole.
- `dynamodb_table_name` - s8anatoledb.
