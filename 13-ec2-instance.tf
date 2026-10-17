data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet_01.id
  key_name = aws_key_pair.ec2_key.id
  vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

# SSH Setting used by provisioner 
connection {
  type = "ssh"
  host = self.public_ip
  user = "ubuntu"
  private_key = tls_private_key.ssh_key.private_key_pem
}

# Copy file to the remote instance
provisioner "file" {
  source = "${path.module}/my-ec2-key.pem"
  destination = "/tmp/ec2-key.pem"
}

provisioner "remote-exec" {
  inline = [ 

    "sudo apt update -y",
    "sudo apt upgrade -y",
    "sudo apt install unzip -y",
    "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --tls-san ${self.public_ip} --node-external-ip ${self.public_ip}' sh -",
    "sudo cat /var/lib/rancher/k3s/server/node-token >> /tmp/k3s-token",
    "sudo cat /etc/rancher/k3s/k3s.yaml >> /tmp/k3s-kubeconfig"
   ]
}

provisioner "local-exec" {
  command = "scp -o StrictHostKeyChecking=no -i '${path.module}/my-ec2-key.pem' ubuntu@${self.public_ip}:/tmp/k3s-kubeconfig  '${path.module}/kubeconfig' && scp -o StrictHostKeyChecking=no -i '${path.module}/my-ec2-key.pem' ubuntu@${self.public_ip}:/tmp/k3s-token  '${path.module}/k3s-token'"
}

provisioner "local-exec" {
  command = "sed -i 's/127.0.0.1/${self.public_ip}/g' '${path.module}/kubeconfig'"
}


  tags = {
    Name = "${var.environment}_k3s_master"
  }
}