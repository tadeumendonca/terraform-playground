provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name = "AWS-QuickStart"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

resource "aws_instance" "another" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name = "AWS-QuickStart"
}

output "ip" {
  value = aws_eip.ip.public_ip
}