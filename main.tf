data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type # t3.micro
  subnet_id     = aws_subnet.public_subnet.id
  
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.exam_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              amazon-linux-extras install nginx1 -y

              systemctl start nginx
              systemctl enable nginx

              echo '<h1>Project Genesis SUCCESS! Deployed by jamiya</h1>' > /usr/share/nginx/html/index.html
              
              systemctl restart nginx
              EOF

  tags = {
    Name = "Project-Genesis-Web-Server"
  }
}