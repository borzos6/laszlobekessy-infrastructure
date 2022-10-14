# ==================================== #
# TERRAFORM STATE
# ==================================== #
resource "aws_s3_bucket" "laszlobekessy_terraform_state" {
  provider      = aws.eu_central_1
  bucket        = "laszlobekessy-terraform-state"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "laszlobekessy_terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.laszlobekessy_terraform_state.id
  versioning_configuration {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}
