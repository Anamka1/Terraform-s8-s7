variable "bucket_name" {
  description = "s3anatole"
  type        = string
}

variable "dynamodb_table_name" {
  description = "s8anatoledb"
  type        = string
}

variable "region" {
  description = "us-east-1"
  type        = string
  default     = "us-east-1"
}
