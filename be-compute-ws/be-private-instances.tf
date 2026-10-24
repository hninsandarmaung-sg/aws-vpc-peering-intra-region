data "aws_ami" "be_private_instance_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "backend_private_instance01" {
  ami                    = data.aws_ami.be_private_instance_ami.id
  instance_type          = var.be_instance_type
  key_name               = aws_key_pair.be_keypair.key_name
  subnet_id              = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_subnet01_id
  vpc_security_group_ids = [data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg01_id]
  # subnet_id              = aws_subnet.backend_private_subnet01.id
  # vpc_security_group_ids = [aws_security_group.be_private_sg01.id]

  tags = {
    Name        = "${var.backend_prefix}-private-instance01"
    environment = "${var.backend_environment}"
  }
}

####################################################
# resource "terraform_data" "configure-be-private-instance01" {
#   depends_on = [aws_instance.backend_public_instance01, aws_eip_association.be_public_instance_eip_assoc]
#   triggers_replace = {
#     build_number = timestamp()
#   }

#   provisioner "file" {
#     source      = "${path.module}/files/"
#     destination = "/home/ubuntu/"
#     connection {
#       type                = "ssh"
#       user                = "ubuntu"
#       host                = aws_instance.backend_private_instance01.private_ip
#       private_key         = tls_private_key.be_keypair.private_key_pem
#       bastion_host        = aws_eip.backend_public_instance_eip.public_ip
#       bastion_user        = "ec2-user"
#       bastion_private_key = tls_private_key.be_keypair.private_key_pem
#       #agent               = false
#     }
#   }
#   /* Remote-Exec Is Not Idempotent
#     * Terraform provisioners do not maintain state: each apply or taint triggers all commands exactly as written.
#     * Most shell commands (such as apt install, unzip, and file removals) do not check if actions are needed.
#     * This can lead to unnecessary reinstallation of packages and redundant operations on each run.
#     * Make shell scripts resilient by checking for pre-existing files, packages, and installations.
#     * Use logical conditions (if, checks) in commands to skip steps if already complete.
#     * Preber configuration management tools (Ansible, Chef, etc.) for advanced idempotency.
#     * We're using a little trick here so we can run the provisioner without destroying the VM. Do not do this in production.
#     * If you need ongoing management (Day N) of your virtual machines a tool such as Chef or Puppet is a better choice. 
#     * These tools track the state of individual files and can keep them in the correct configuration.
#   */
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt -y update",
#       # Only install cowsay if not present
#       "if ! command -v cowsay >/dev/null 2>&1; then sudo apt -y install cowsay; fi",
#       "cowsay Hellooooooooooo!",
#       # Only install unzip if not present
#       "if ! command -v unzip >/dev/null 2>&1; then sudo apt -y install unzip; fi",
#       # Only install AWS CLI v2 if not already installed
#       <<-EOT
#       if ! aws --version 2>/dev/null | grep 'aws-cli/2.'; then
#         sudo curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip;
#         sudo unzip -o awscliv2.zip;
#         sudo ./aws/install --update;
#         sudo rm -rf awscliv2.zip aws;
#       fi
#       EOT
#       ,
#       "sudo aws --version",
#     ]
#     connection {
#       type                = "ssh"
#       user                = "ubuntu"
#       host                = aws_instance.backend_private_instance01.private_ip
#       private_key         = tls_private_key.be_keypair.private_key_pem
#       bastion_host        = aws_eip.backend_public_instance_eip.public_ip
#       bastion_user        = "ec2-user"
#       bastion_private_key = tls_private_key.be_keypair.private_key_pem
#       #agent               = false
#     }
#   }
# }

#####################################################################

resource "aws_instance" "backend_private_instance02" {
  ami                    = data.aws_ami.be_private_instance_ami.id
  instance_type          = var.be_instance_type
  key_name               = aws_key_pair.be_keypair.key_name
  subnet_id              = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_subnet02_id
  vpc_security_group_ids = [data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id]
  # subnet_id              = aws_subnet.backend_private_subnet02.id
  # vpc_security_group_ids = [aws_security_group.be_private_sg02.id]

  tags = {
    Name        = "${var.backend_prefix}-private-instance02"
    environment = "${var.backend_environment}"
  }
}

resource "aws_instance" "backend_private_instance03" {
  ami                    = data.aws_ami.be_private_instance_ami.id
  instance_type          = var.be_instance_type
  key_name               = aws_key_pair.be_keypair.key_name
  subnet_id              = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_subnet03_id
  vpc_security_group_ids = [data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id]
  # subnet_id              = aws_subnet.backend_private_subnet03.id
  # vpc_security_group_ids = [aws_security_group.be_private_sg03.id]

  tags = {
    Name        = "${var.backend_prefix}-private-instance03"
    environment = "${var.backend_environment}"
  }
}