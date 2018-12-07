terraform {
  backend "atlas" {
    name = "atanasc/tf-remote-backend"
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0daad02ff4ba87139"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}