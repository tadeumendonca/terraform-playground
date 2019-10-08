provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "AWS-QuickStart"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_instance" "another" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "AWS-QuickStart"
}