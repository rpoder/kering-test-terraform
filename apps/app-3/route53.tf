resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = var.project_name
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.lb.dns_name]
}
