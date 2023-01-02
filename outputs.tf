output "Availability_Zone" {
  value = length(data.aws_availability_zones.az.names)
}
output "subnet_count" {
  value = local.subnet_count
}
output "WordPress-URL" {
  value = "http://${aws_route53_record.public-dns.fqdn}"
}
