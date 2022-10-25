
provider "aws" {

  access_key  = "AKIA3AHGVKKXXIKTX24V"
  secret_key = "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" 
  region     = "us-east-2"
}


#Create security group with firewall rules
resource "aws_security_group" "sec-auto_jenkins_job" {
  name        = "sec-auto_jenkins_job"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress { 
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_jenkins_job"
  }
}

resource "aws_instance" "automate-job" {
  ami           = "ami-09d3b3274b6c5d4aa"
  key_name = "awskeypair"
  instance_type = "t2.micro"
  security_groups= [ "sec-auto_jenkins_job"]
  tags= {
    Name = "automate-jobs"
  }
}




