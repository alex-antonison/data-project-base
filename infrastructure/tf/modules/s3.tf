######################
# Athena Workgorup Output Bucket
######################


resource "aws_s3_bucket" "athena_workgroup_output" {
  bucket = "${var.project_name}-athena-work-group-output-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_public_access_block" "athena_workgroup_output" {
  bucket = aws_s3_bucket.athena_workgroup_output.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# this will remove athena queried objects after 1 day
resource "aws_s3_bucket_lifecycle_configuration" "athena_workgroup_output_lifecycle" {
  bucket = aws_s3_bucket.athena_workgroup_output.id

  rule {
    id = "expire_after_1_day"
    filter {}
    expiration { days = 1 }
    status = "Enabled"
  }
}


######################
# Raw Data Bucket
######################

resource "aws_s3_bucket" "raw_data" {
  bucket = "${var.project_name}-raw-data-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_public_access_block" "raw_data" {
  bucket = aws_s3_bucket.raw_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "raw_data" {
  bucket = aws_s3_bucket.raw_data.id

  rule {
    id = "expire_after_30_days"
    filter {}
    expiration { days = 30 }
    status = "Enabled"
  }
}

######################
# Data Lake Bucket
######################

resource "aws_s3_bucket" "data_lake" {
  bucket = "${var.project_name}-data-lake-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_public_access_block" "data_lake" {
  bucket = aws_s3_bucket.data_lake.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
