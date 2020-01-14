resource "aws_default_security_group" "default" {
  vpc_id = "vpc-e24e6898" 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default"
    Description = "default VPC security group"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_block_ssh
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_www" {
  name        = "allow_www"
  description = "Allow http inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_www"
  }
}

/*
resource "aws_security_group" "allow_oracle" {
  provider    = aws.virginia
  name        = "allow_oracle"
  description = "Allow Oracle inbound traffic"

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_block_ssh
  }

  tags = {
    Name = "allow_oracle"
  }
}
*/