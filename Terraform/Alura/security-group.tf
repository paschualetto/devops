resource "aws_security_group" "allow_ssh_virginia" {
  provider    = aws.virginia
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_block_ssh
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_ssh_ohio" {
  provider    = aws.ohio
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_block_ssh
  }

  tags = {
    Name = "allow_ssh"
  }
}