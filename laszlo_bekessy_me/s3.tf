# ==================================== #
# LASZLO.BEKESSY.ME PRODUCTION (GATSBY)
# ==================================== #
resource "aws_s3_bucket" "laszlo_bekessy_me" {
  provider      = aws.eu_central_1
  bucket        = "laszlo.bekessy.me"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "laszlo_bekessy_me_s3_bucket_acl" {
  bucket = aws_s3_bucket.laszlo_bekessy_me.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "laszlo_bekessy_me_s3_website_configuration" {
  bucket = aws_s3_bucket.laszlo_bekessy_me.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "laszlo_bekessy_me_policy" {
  provider = aws.eu_central_1
  bucket   = aws_s3_bucket.laszlo_bekessy_me.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "Public access"
    Statement = [
      {
        Sid       = "Allow public access"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject", "s3:GetObjectVersion"]
        Resource = [
          "${aws_s3_bucket.laszlo_bekessy_me.arn}",
          "${aws_s3_bucket.laszlo_bekessy_me.arn}/*",
        ]
      },
    ]
  })
}
