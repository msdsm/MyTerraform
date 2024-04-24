output "dns_name" {
  value = module.alb.dns_name
}

output "url" {
  # 変数化して汎化したい
  value = "http://${module.alb.dns_name}:80"
}
