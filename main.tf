module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  tags         = var.tags
  cidr_block   = var.cidr_block
}

module "elastiCache" {
  source                = "./modules/elastiCache"
  vpc_id                = module.network.vpc_id
  subnet_ids            = [module.network.subnet_priv_1a, module.network.subnet_priv_1b]
  allowed_cidrs         = [module.network.vpc_cidr]
  replication_group_id  = "elastic-cache-redis-${terraform.workspace}"
  node_type             = "cache.t3.micro"
  replicas_per_node_group = 1 # 1 replica (total = 2 nós)
  engine_version          = "7.1"
}