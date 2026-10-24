output "be_instances_private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.be_keypair.private_key_openssh
  sensitive   = true
}
# terraform output -raw be_instances_private_key > be-sshkey.pem
# chmod 400 be-sshkey.pem
# curl -s http://169.254.169.254/latest/meta-data/public-ipv4

output "backend_public_instance_public_ip" {
  description = "Public IP of the backend instance"
  value       = aws_instance.backend_public_instance01.public_ip
}

output "backend_public_instance_public_dns" {
  description = "Public DNS of the backend instance"
  value       = aws_instance.backend_public_instance01.public_dns
}

output "backend_private_instance01_private_ip" {
  description = "Private IP of the backend private instance 01"
  value       = aws_instance.backend_private_instance01.private_ip
}

output "backend_private_instance02_private_ip" {
  description = "Private IP of the backend private instance 02"
  value       = aws_instance.backend_private_instance02.private_ip
}

output "backend_private_instance03_private_ip" {
  description = "Private IP of the backend private instance 03"
  value       = aws_instance.backend_private_instance03.private_ip
}

