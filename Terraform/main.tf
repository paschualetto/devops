provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = "ami-0dacb0c129b49f529"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homolog]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "paschualetto-dev4"
  acl    = "private"

  tags = {
    Name = "paschualetto-dev4"
  }
}

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
