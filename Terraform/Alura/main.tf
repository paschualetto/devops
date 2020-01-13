provider "aws" {
  alias = "virginia"
  version = "~> 2.0"
  region  = var.virginia
}

provider "aws" {
  alias = "ohio"
  version = "~> 2.0"
  region  = var.ohio
}

resource "aws_instance" "server1" {
  count = 2
  provider = aws.virginia
  ami = var.amis["virginia"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "TF-virginia-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_virginia.id}"]
}

resource "aws_instance" "server2" {
  count = 2
  provider = aws.ohio
  ami = var.amis["ohio"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "TF-ohio-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_ohio.id}"]
}

/* Comment to destroy this instance
resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homolog]
}
*/

/*
resource "aws_s3_bucket" "dev4" {
  bucket = "paschualetto-dev4"
  acl    = "private"

  tags = {
    Name = "paschualetto-dev4"
  }
}
*/

/*
# terraform destroy -target aws_dynamodb_table.dynamodb-homolog
resource "aws_dynamodb_table" "dynamodb-homolog" {
  provider       = aws.us-east-2
  name           = "UserData"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "UserEmail"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "UserEmail"
    type = "S"
  }
}
*/
