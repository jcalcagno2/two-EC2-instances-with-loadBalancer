variable "aws_region" {
    default = "us-east-1"
}

variable "security_group_name" {
    default = "JoesSecurityGroup"
}

variable "vpc_id" {
    default = "vpc-0db94963fca5fca82"
}

variable "security_group_description" {
    default = "Allow HTTP inbound traffic"
}


variable "ami_id" {
    default = "ami-022e1a32d3f742bd8"
}


variable "instance_type" {
    default = "t2.micro"
}


variable "subnet_one_id" {
    default = "subnet-00c67a68ef83a4960"
}

variable "subnet_two_id" {
    default = "subnet-02f99f1e74dc7dcb4"
}

variable "instance_one_name" {
    default = "firstInstance"
}

variable "instance_two_name" {
    default = "secondInstance"
}

variable "target_group_name" {
    default = "JoesTargetGroup"

}

variable "target_group_port" {
    default = 80
}

variable "target_group_protocol" {
    default = "HTTP"
}

variable "load_balancer_listener_port" {
    default = 80
}

variable "load_balancer_listener_protocol" {
    default = "HTTP"
}






