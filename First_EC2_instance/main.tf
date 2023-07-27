//infrastructure sandbox
provider "aws" {
    region = var.aws_region
}



resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.4.0.0/16"]
  }

  ingress {
    description = "HTTP from client"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "SSH from client"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}




resource "aws_instance" "firstInstance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_one_id
    vpc_security_group_ids = [aws_security_group.sg.id]


    user_data = <<EOF
        !#/bin/bash
        sudo yum install httpd -y
        sudo service httpd start
        sudo systemctl enable httpd.service
    EOF

    tags = {
        Name = var.instance_one_name
    }

}

resource "aws_instance" "secondInstance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_two_id
    vpc_security_group_ids = [aws_security_group.sg.id]

    tags = {
        Name = var.instance_two_name
    }

    user_data = <<EOF
        !#/bin/bash
        sudo yum install httpd -y
        sudo service httpd start
        sudo systemctl enable httpd.service
    EOF

}



