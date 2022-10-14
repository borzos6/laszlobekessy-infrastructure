resource "aws_iam_policy" "laszlobekessy_deploy_policy_laszlo_bekessy_me_resources" {
  provider    = aws.us_east_1
  name        = "laszlobekessy-deploy-policy-laszlo-bekessy-me-resources"
  description = "IAM Policy for S3 automated deployment"
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "AllowBucketAccess",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:GetBucketPolicy",
          "s3:GetBucketVersioning",
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.laszlo_bekessy_me.arn}",
          "${aws_s3_bucket.laszlo_bekessy_me.arn}/*",
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "laszlobekessy_deploy_attachment_laszlo_bekessy_me_resources" {
  provider   = aws.us_east_1
  user       = data.aws_iam_user.laszlobekessy_deploy.user_name
  policy_arn = aws_iam_policy.laszlobekessy_deploy_policy_laszlo_bekessy_me_resources.arn
}

resource "aws_iam_policy" "laszlobekessy_cloudfront_invalidation_policy_laszlo_bekessy_me_resources" {
  provider    = aws.us_east_1
  name        = "laszlobekessy-cloudfront-invalidation-policy-laszlo-bekessy-me-resources"
  description = "IAM Policy for CloudFront automated deployment"
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid"      = "AllowCloudFrontInvalidation",
        "Effect"   = "Allow",
        "Action"   = "cloudfront:CreateInvalidation",
        "Resource" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.laszlo_bekessy_me_cloudfront_distribution.id}"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "laszlobekessy_deploy_attachment_laszlo_bekessy_me_cloudfront_resources" {
  provider   = aws.us_east_1
  user       = data.aws_iam_user.laszlobekessy_deploy.user_name
  policy_arn = aws_iam_policy.laszlobekessy_cloudfront_invalidation_policy_laszlo_bekessy_me_resources.arn
}
