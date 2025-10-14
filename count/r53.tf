resource "aws_route53_record" "roboshop" {
  count = 4
  zone_id = "${var.zone_id}"
  name    = "${var.instances[count.index]}.${var.domain_name}" # mongodb.daws86s.fun
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}