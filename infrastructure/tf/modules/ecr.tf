resource "aws_ecr_repository" "data_pipeline" {
  name = "serverless-datapipeline-${var.environment}"
}

# this will expire old untagged images
resource "aws_ecr_lifecycle_policy" "data_pipeline" {
  repository = aws_ecr_repository.data_pipeline.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 7 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}