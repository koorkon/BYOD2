output "web_url" {
  description = "The public URL of the deployed web server"
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}