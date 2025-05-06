resource "aws_route53_record" "dns_records" {
  for_each = aws_instance.Servers
  name     = each.key=="frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type     = "A"
  zone_id  = "Z07576272AGE7XC4FQPDT"
  ttl      = 1
  records = [each.key=="frontend" ? each.value.public_ip : each.value.private_ip]

}