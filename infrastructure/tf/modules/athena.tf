# configure an athena workgroup
resource "aws_athena_workgroup" "data_lake_workgroup" {
  name = "data_lake_workgroup"
  configuration {
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = false

    engine_version {
      selected_engine_version = "Athena engine version 3"
    }

    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena_workgroup_output.bucket}/"
    }
  }
}