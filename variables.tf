variable "region" {
  default     = "ap-south-1"
  description = " Project Region"
}

variable "access-key" {
  default     = "###############"
  description = "IAM user access key"
}

variable "secret-key" {
  default     = "################"
  description = "IAM user secret-key"
}

variable "vpc_cidr" {
  default     = "172.22.0.0/16"
  description = "CIDR value of VPC"
}
variable "instance-type" {
  default = "t2.micro"
  description = "Ec2 Instance Type"
}
locals {
  common_tags = {
    environment = "Production"
    project     = "WordPress"
  }
  subnet_count = length(data.aws_availability_zones.az.names)
  ami-id = data.aws_ami.ami.image_id
}

variable "private-domain"{
  default = "backtracker.local"
  description = "DB_HOST Value"
}
variable "public-domain"{
  default = "backtracker.tech"
  description = "WordPress application Hostname"
}
