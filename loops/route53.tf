resource "aws_route53_record" "route53private" {
  count           = 3
  name            = "${var.server_type[count.index]}.${var.hostedzone}"
  type            = "A"
  zone_id         = "Z04730311DPFG7PGUF4PF"
  ttl             = 1
  records         = [aws_instance.ExpenseVM[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "route53public" {
  name            = var.hostedzone
  type            = "A"
  zone_id         = "Z04730311DPFG7PGUF4PF"
  ttl             = 1
  records         = [aws_instance.ExpenseVM[1].public_ip]
  allow_overwrite = true
}