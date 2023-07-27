output "lb_dns_name" {
    description = "dns name of load balancer"
    value = aws_lb.lb.dns_name
}