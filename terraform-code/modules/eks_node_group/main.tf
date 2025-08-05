resource "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  disk_size      = var.disk_size
  instance_types = [var.instance_type]

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
    source_security_group_ids = [var.security_group_id]
  }

  labels = {
    env = var.environment
  }

  tags = {
    Name        = var.node_group_name
    Environment = var.environment
  }
}
