# Terraform AWS Configuration - 2023-03-15
output "instance_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of EC2 instance"
}

