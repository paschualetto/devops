locals {
  instance_number = lookup(var.instance_number, var.env)

  file_ext    = "zip"
  object_name = "file-generated-by-template"

  common_tags = {
    "Owner"     = "Fernando Paschualetto"
    "CreatedAt" = "2022-07-14"
    "ManagedBy" = "Terraform"
  }
}