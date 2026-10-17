# RSA key of size 4096 bits
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-keypair"
  public_key = tls_private_key.ssh_key.public_key_openssh
}


resource "local_sensitive_file" "ec2_private_key" {
    content = tls_private_key.ssh_key.private_key_pem
    filename = "${path.module}/my-ec2-key.pem"
    file_permission = "0600"
  
}
