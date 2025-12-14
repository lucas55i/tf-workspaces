variable "vpc_id" {
  description = "ID da VPC onde o Redis será criado"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "allowed_cidrs" {
  description = "CIDRs que podem acessar o Redis"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "replication_group_id" {
  description = "ID do replication group"
  type        = string
  default     = "meu-redis-ha"
}

variable "node_type" {
  description = "Tipo de instância do Redis"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_nodes" {
  description = "Número de nós do Redis"
  type        = number
  default     = 2
}

variable "replicas_per_node_group" {
  description = "Número de réplicas por grupo de nós (1 = 1 primary + 1 replica)"
  type        = number
  default     = 1
}

variable "engine_version" {
  description = "Versão do Redis"
  type        = string
  default     = "7.1"
}

variable "redis_subnet_group" {
  description = "Versão do Redis"
  type        = string
  default     = "redis-subnet-group"
}
