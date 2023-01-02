data "aws_availability_zones" "az" {
  state = "available"
}

data "aws_route53_zone" "my-zone" {
  name         = "${var.public-domain}"
  private_zone = false
}
data "aws_ami" "ami" {
 most_recent = true
 owners = ["amazon"]
 name_regex = "^amzn2-ami-kernel*"
}

