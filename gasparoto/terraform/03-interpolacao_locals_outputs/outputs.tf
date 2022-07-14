output "bucket_name" {
  value = aws_s3_bucket.paschua-test-bucket.bucket
}

output "bucket_arn" {
  value       = aws_s3_bucket.paschua-test-bucket.arn
  description = "ARN do bucket"
}

output "bucket_domain_name" {
  value = aws_s3_bucket.paschua-test-bucket.bucket_domain_name
}

output "ips_file_path" {
  value = "${aws_s3_bucket.paschua-test-bucket.bucket}/${aws_s3_bucket_object.this.key}"
}