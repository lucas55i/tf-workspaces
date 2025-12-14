variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all AWS resources"
}
variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "env" {
  type = string
}

variable "node_type" {
  description = "Tipo de instância do Redis"
  type        = string
  default     = "cache.t3.micro"
}