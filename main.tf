# Using a single workspace as TFE remote backend
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "atanasc"

    workspaces {
      name = "tf-remote-backend"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-2"
}

# Create some AWS resource
resource "aws_instance" "web" {
  ami           = "ami-0daad02ff4ba87139"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
