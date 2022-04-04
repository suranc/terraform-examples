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

resource "aws_instance" "chris_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "chris_ec2"
  }

  key_name = aws_key_pair.terraform_example_ec2_key.id
}

resource "aws_key_pair" "terraform_example_ec2_key" {
  key_name   = "terraform_example_ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7IGozq19XdGJHdxavVEicuk1Rzwcsl4zaFyJY875jJqh8Lg5P7b0AQxcGFuE8BSDEMb0iPWPn5WeUTuxOdo+hYfKlCCnpcsWIWqm5ULobKvX9zAlkBWsaVAPVVMoxhTyWJON4trUfWrMesOJ8utnohJB/1OevlmKJHdODR3CokZHcXv5uqqvi8wABg8JYOWUis54kPeaEDheaCXH45Gq/8XAav7aAdyK3tU0Zv1YTkrddfSCu2VMNEtXwBD10z59L1FyMBXV/q3o56xMhb6K0eXVrlLOXCg4+PiFVWauJGsjt960EMEcxV6NhnGCjG8xeLLbP/+hLQyBUUAcWN6mI5In9xF0grctKB1gKGoRXpuHTfI+x8I5zDGdSUFfHnt/+ACRczWwl9BmZySNli+Bxzjba8EUyfPkDNIlM/s8oHu3udy4p4notfp4hqLSqnY78DHLLtFX+b8Xvx139iVaXbs7enenwL73QZfIJH7rVTJ8E4kjXLjxPXwRDwKBJs6E= chris@desktop"
}

output "region" {
  value = "${var.region}"
}

output "instanceTags" {
  value = "${aws_instance.chris_ec2.tags}"
}