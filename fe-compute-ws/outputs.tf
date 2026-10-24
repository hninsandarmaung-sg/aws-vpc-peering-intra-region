output "fe_instances_private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.fe_keypair.private_key_openssh
  sensitive   = true
}
# terraform output -raw fe_instances_private_key > fe-sshkey.pem
# chmod 400 fe-sshkey.pem
# curl -s http://169.254.169.254/latest/meta-data/public-ipv4

output "frontend_public_instance_public_ip" {
  description = "Public IP of the frontend instance"
  value       = aws_instance.frontend_public_instance01.public_ip
}

output "frontend_public_instance_public_dns" {
  description = "Public DNS of the frontend instance"
  value       = aws_instance.frontend_public_instance01.public_dns
}

output "frontend_private_instance01_private_ip" {
  description = "Private IP of the frontend private instance 01"
  value       = aws_instance.frontend_private_instance01.private_ip
}

output "frontend_private_instance02_private_ip" {
  description = "Private IP of the frontend private instance 02"
  value       = aws_instance.frontend_private_instance02.private_ip
}

output "frontend_private_instance03_private_ip" {
  description = "Private IP of the frontend private instance 03"
  value       = aws_instance.frontend_private_instance03.private_ip
}

