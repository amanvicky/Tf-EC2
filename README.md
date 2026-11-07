# Terraform × EC2 — Config Farm

Over a hundred `ec2_config_*.tf` variants generated while drilling Terraform-to-EC2 provisioning: instance types, AMIs, key pairs, security groups, user-data bootstrap, tags, and outputs.

## Why 100+ files

Each config isolates **one variable at a time** — a controlled experiment per file, so any drift in plan output traces back to a single change. Generated programmatically, committed deliberately.

## Typical shape

```hcl
provider "aws" { region = "ap-south-1" }
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = { Name = "tf-ec2-lab" }
}
```

Prerequisites: AWS account + `aws configure`, Terraform >= 1.0.

```bash
terraform init && terraform plan && terraform apply
```

Pairs with [cloudformation-practice](https://github.com/amanvicky/cloudformation-practice) — the same infrastructure, two IaC philosophies.
