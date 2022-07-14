resource "aws_s3_bucket" "paschua-test-bucket" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "private_acl_bucket" {
  bucket = aws_s3_bucket.paschua-test-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "this" {
  bucket       = aws_s3_bucket.paschua-test-bucket.bucket
  key          = "config/${local.ip_filepath}"
  source       = local.ip_filepath
  content_type = local.json_content_type
  etag         = filemd5(local.ip_filepath)
  tags         = local.common_tags
}

resource "aws_s3_bucket_object" "random" {
  bucket       = aws_s3_bucket.paschua-test-bucket.bucket
  key          = "config/${random_pet.bucket.id}.json"
  source       = local.ip_filepath
  content_type = local.json_content_type
  etag         = filemd5(local.ip_filepath)
  tags         = local.common_tags
}

resource "aws_s3_bucket" "manual" {
  bucket = "paschuabucket"
  tags = {
    "CreatedIn"  = "12/07/2022"
    "ImportedIn" = "14/07/2022"
    "ManagedBy"  = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "private_acl_manual" {
  bucket = aws_s3_bucket.manual.id
  acl    = "private"
}