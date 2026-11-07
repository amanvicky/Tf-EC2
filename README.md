# Terraform — 211 Study Cards, One Resource Each

Two hundred and eleven dated `.tf` files, written between 2023-01-02 and 2023-06-29 — one per practice card while drilling Terraform against AWS. Each file isolates a single resource so any `terraform plan` difference traces to exactly one block.

## What the cards actually cover

Counted across the repo (this is the real distribution, not a wish list):

| Resource | Cards |
|---|---|
| `aws_subnet` | 47 |
| `aws_security_group` | 38 |
| `aws_instance` | 32 |
| `aws_vpc` | 27 |
| `variable` / `output` / companion blocks | ~67 more files |

So the deck is a full network stack in isolation pieces — VPCs first, then subnets into them, security groups over both, and finally instances wired through. That order wasn't accidental: it's how the course built up, and how AWS networking actually layers.

## Two cards, verbatim

**An instance** (`ec2_config_1.tf`):

```hcl
# Terraform AWS Configuration - 2023-01-02
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer"
  }
}
```

**A security group** (`ec2_config_109.tf`):

```hcl
# Terraform AWS Configuration - 2023-04-10
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

The dates on the comment lines are the study log: 211 cards across six months, roughly one every other day, with the instance cards drifting toward variables and outputs as the course progressed (35 files take `variable`, 32 declare `output`).

## Using a card

Each card is a self-contained snippet, not a full stack — drop it into a directory with a provider block, or paste it into an existing `main.tf`:

```bash
terraform init
terraform plan
terraform apply
```

An AWS account with `aws configure` done first. A `0.0.0.0/0` SSH rule like card 109 is fine on a lab account — in anything real, scope it to your IP.

## The other IaC philosophy

[cloudformation-practice](https://github.com/amanvicky/cloudformation-practice) covers the same ground in CloudFormation — parameters, mappings, `cfn-init`, change sets. Terraform vs CloudFormation on the same concepts, which is the fastest way to understand what each tool is actually for.
