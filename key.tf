resource "tls_private_key" "generated" {
  count = var.create_key_pair && var.key_name == "" ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  count = var.create_key_pair && var.key_name == "" ? 1 : 0

  key_name   = "${var.name_prefix}-key"
  public_key = tls_private_key.generated[0].public_key_openssh
}

# Use the proper key name depending on what's given/created
locals {
  ec2_key_name = var.key_name != "" ? var.key_name : (
    var.create_key_pair ? aws_key_pair.generated[0].key_name : null
  )
}