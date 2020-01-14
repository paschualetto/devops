provider "aws" {
  version = "~> 2.0"
  region  = var.virginia
}

/*resource "aws_instance" "cluster-1" {
  count = 2
  ami = var.amis["ubuntu-18"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "tf-cl1-${count.index}"
  }
  vpc_security_group_ids = [
                            "${aws_security_group.allow_ssh.id}", 
                            "${aws_default_security_group.default.id}"
                           ]
}*/

resource "aws_instance" "server-images" {
  ami = var.amis["ubuntu-18"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "tf-server-images"
  }
  vpc_security_group_ids = [
                            "${aws_security_group.allow_ssh.id}", 
                            "${aws_default_security_group.default.id}", 
                            "${aws_security_group.allow_www.id}"
                           ]
  depends_on = [aws_s3_bucket.bucketlabs]
}

resource "aws_s3_bucket" "bucketlabs" {
  bucket = "paschualabs"
  acl    = "private"

  tags = {
    Name        = "Paschua Bucket"
    Environment = "Dev"
  }
}


/*
resource "aws_db_instance" "oracle-db" {
  provider = aws.virginia

  identifier            = "oracle-test"
  engine                = "oracle-se"
  engine_version        = "12.1.0.2.v18"
  instance_class        = var.db_instance_type
  license_model         = "bring-your-own-license"
  
  allocated_storage     = 50
  max_allocated_storage = 100
  storage_encrypted     = false
  
  name                                = "ORACLEDB"
  username                            = "admin"
  password                            = "Fernando123!"
  port                                = "1521"
  iam_database_authentication_enabled = false

  vpc_security_group_ids = ["${aws_security_group.allow_oracle.id}"]
  maintenance_window     = "Mon:00:00-Mon:03:00"
  backup_window          = "03:00-06:00"
  backup_retention_period = 0

  tags = {
    Owner       = "fernando"
    Environment = "test"
  }

  final_snapshot_identifier = "oracledb"
  character_set_name = "WE8MSWIN1252"
  deletion_protection = false
}
*/