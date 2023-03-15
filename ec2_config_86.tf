# Terraform AWS Configuration - 2023-03-15
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MainVPC"
  }
}

