# ==================================== #
# CLOUDFRONT LOGS
# ==================================== #
resource "aws_s3_bucket" "laszlobekessy_cloudfront_logs" {
  provider      = aws.eu_central_1
  bucket        = "laszlobekessy-cloudfront-logs"
  force_destroy = false
}


resource "aws_s3_bucket_lifecycle_configuration" "laszlobekessy_cloudfront_logs_lifecycle_configuration" {
  bucket = aws_s3_bucket.laszlobekessy_cloudfront_logs.id

  rule {
    id     = "remove-objects-older-than-1-year"
    status = "Enabled"

    expiration {
      days = 365
    }
    noncurrent_version_expiration {
      noncurrent_days = 1
    }
  }
}

resource "aws_s3_bucket_acl" "laszlobekessy_cloudfront_logs_bucket_acl" {
  bucket = aws_s3_bucket.laszlobekessy_cloudfront_logs.id

  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current_user.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    grant {
      grantee {
        id   = data.aws_cloudfront_log_delivery_canonical_user_id.cloudfront_user.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current_user.id
    }
  }
}
