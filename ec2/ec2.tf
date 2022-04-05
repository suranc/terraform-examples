data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_region" "current" {}

resource "aws_instance" "chris_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  count = 2

  tags = {
    Name = "chris_ec2"
  }

  key_name = aws_key_pair.terraform_example_ec2_key.id
}

resource "aws_key_pair" "terraform_example_ec2_key" {
  key_name   = "terraform_example_ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5ZhO6ux14MCe2ldk0oTSHlabrQHq5M8ygOiaf6yDNP4bHhlfOMQk4HH/vuJPuLs4hPT1SP0I5xHDJac/tB9QgUTsM/dDNvWyVHFaKJT/7OlA82e7vdc1ir/rKkDeJ8d+7CMxOpf7xOP3ZsEf4jceFt09ulYql5ded7G9pQd1hEo9MqHMz9wWh3xPHyWU3nD6VrhI61MV1ZYuezbQ5w/Q544vimLo29sgp7Taw1HODaLhzbz+E0/gMiiVtTeMCNbsVTX+FK0HMpEOIUyVpV7dR/CGXaE9Qy3+h1BGvI/Qh4Uw5K7Po4WcCLRbxrtKMF5xHoejOSXl2X9An7g8YyEZbOFxSANhQmQL072NpB0zu0jaUI7XS5/jTFBLiLX5XGDqQNqIorNQJd16osGCvD5zH+sGFDFAOSOaAtj2nek8xwEfDfbbLpeyAAkKFg2YzqFfJL7p2ZLrDcs1AKwng8uXckMZviHJTu8GmWo9D+vQdQtsxaoQ1pnRMszwiNkoQedE= chris@desktop"
}

output "region" {
  value = data.aws_region.current.name
}

output "instanceTags" {
  value = "${aws_instance.chris_ec2.tags}"
}

output "public_ip" {
  value = aws_instance.chris_ec2[*].public_ip
}