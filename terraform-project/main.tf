provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins-terraform-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-07a00cf47dbbc844c"
  instance_type = "t3.small"
  key_name      = "TrendStore"

  security_groups = [aws_security_group.jenkins_sg.name]

user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install openjdk-21-jdk docker.io git wget -y

              systemctl start docker
              systemctl enable docker

              usermod -aG docker ubuntu

              wget https://get.jenkins.io/war-stable/latest/jenkins.war -O /home/ubuntu/jenkins.war

              chown ubuntu:ubuntu /home/ubuntu/jenkins.war
              EOF

  tags = {
    Name = "Jenkins-Server-Terraform"
  }
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
