resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  key_name = local.ec2_key_name

  vpc_security_group_ids = var.create_security_group ? [aws_security_group.this[0].id] : [var.security_group_id]

  iam_instance_profile = var.iam_instance_profile_name != null ? var.iam_instance_profile_name : null
}
