variable "aws_region" {
  description = "AWS region to launch servers"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-071226ecf16aa7d96" # Amazon Linux 2 AMI (update as needed)
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair to use"
  default     = "cd_project"
}

