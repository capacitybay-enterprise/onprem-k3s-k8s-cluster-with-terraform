# locals {
#   worker_subnets = [
#     aws_subnet.public_subnet_01.id,
#     aws_subnet.public_subnet_02.id
#   ]
# }

# resource "aws_instance" "workers" {
#   count = var.worker-count
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type

#   subnet_id = element(local.worker_subnets, count.index)

#   key_name = aws_key_pair.ec2_key.id
#   vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]

#   root_block_device {
#     volume_size = 20
#     volume_type = "gp3"
#   }

#  depends_on = [ aws_instance.example ]

#  # SSH Setting used by provisioner 
# connection {
#   type = "ssh"
#   host = self.public_ip
#   user = "ubuntu"
#   private_key = tls_private_key.ssh_key.private_key_pem
# }

# # Copy file to the remote instance
# provisioner "file" {
#   source = "${path.module}/k3s-token"
#   destination = "/tmp/k3s-token"
# }


# provisioner "remote-exec" {
#   inline = [ 

#     "sudo apt update -y",
#     "sudo apt upgrade -y",
#     "sudo apt install unzip -y",
#     "curl -sfL https://get.k3s.io | K3S_URL=https://${aws_instance.example.public_ip}:6443 K3S_TOKEN_FILE=/tmp/k3s-token  INSTALL_K3S_EXEC='agent --node-external-ip ${self.public_ip}' sh -"

#    ]
# }
# }