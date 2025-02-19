data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]
  private_ip             = "10.0.1.10"
  ebs_optimized          = true
  key_name               = "web"
  user_data              = file("user_data.sh")

  ebs_block_device {
    device_name = "/dev/xvda"
  }

  tags = {
    "Name" = "web"
  }
}

resource "aws_instance" "db" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db.id]
  private_ip             = "10.0.2.10"
  key_name               = "web"
  ebs_optimized          = true

  ebs_block_device {
    device_name = "/dev/xvda"
  }

  tags = {
    "Name" = "db"
  }
}
