resource "aws_security_group" "redis_sg" {
  name        = "redis-sg"
  description = "Security group para Redis"
  vpc_id      = var.vpc_id

  ingress {
    description = "Redis access"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group-${terraform.workspace}"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "redis_rg" {
  replication_group_id = var.replication_group_id
  description          = "Redis com alta disponibilidade"

  engine          = "redis"
  engine_version  = var.engine_version
  node_type       = var.node_type
  port            = 6379

  num_node_groups         = 1
  replicas_per_node_group = var.replicas_per_node_group

  automatic_failover_enabled = true
  multi_az_enabled           = true

  subnet_group_name  = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids = [aws_security_group.redis_sg.id]
}


