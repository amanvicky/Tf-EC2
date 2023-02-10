# Terraform AWS Configuration - 2023-02-10
output "instance_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of EC2 instance"
}

