locals {

  ip_filepath       = "ips.json"
  json_content_type = "application/json"

  common_tags = {
    Service     = "Learning Terraform"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "Fernando Paschualetto"
    Name        = "Test Bucket"
  }
}