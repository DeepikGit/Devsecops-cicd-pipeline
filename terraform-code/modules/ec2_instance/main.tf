resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids  = var.vpc_security_group_ids
  key_name      = var.key_name
  associate_public_ip_address = var.associate_public_ip_address


  tags = {
    Name = var.name
  }
    user_data = var.user_data
}