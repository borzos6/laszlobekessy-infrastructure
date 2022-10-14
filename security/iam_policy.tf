resource "aws_iam_policy" "cloudwatch_metrics_access" {
  provider    = aws.eu_central_1
  name        = "cloudwatch-metrics-access"
  description = "Access to Cloudwatch Metrics"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowCloudWatchMetricAccess"
        Action = [
          "cloudwatch:PutMetricData",
          "cloudwatch:GetMetricData",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:GetMetricWidgetImage",
          "cloudwatch:ListMetrics"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "cloudwatch_logging_access" {
  provider    = aws.eu_central_1
  name        = "cloudwatch-logging-access"
  description = "Read and Write Cloudwatch logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowCloudWatchLoggingAccess"
        Action   = "logs:*",
        Effect   = "Allow"
        Resource = "*",
      }
    ]
  })
}

resource "aws_iam_policy" "s3_console_generic_access" {
  provider    = aws.eu_central_1
  name        = "s3-console-generic-access"
  description = "Generic access to S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowSESAccess"
        Action = [
          "s3:GetAccountPublicAccessBlock",
          "s3:GetBucketPublicAccessBlock",
          "s3:GetBucketPolicyStatus",
          "s3:GetBucketAcl",
          "s3:ListAccessPoints"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
