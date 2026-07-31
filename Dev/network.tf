module "dev-vpc1" {
  source               = "../modules/network"
  vpc_name             = "App"
  cidr_block           = "10.1.0.0/16"
  public_subnets_cidr  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  private_subnets_cidr = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  env                  = var.env
}

module "dev-vpc2" {
  source               = "../modules/network"
  vpc_name             = "Test1"
  cidr_block           = "10.2.0.0/16"
  public_subnets_cidr  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  private_subnets_cidr = ["10.2.10.0/24", "10.2.20.0/24", "10.2.30.0/24"]
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  env                  = var.env
}


# module "dev-sg1" {
#   source   = "../modules/sg"
#   vpc_name = module.dev-vpc1.vpc_name
#   vpc_id   = module.dev-vpc1.vpc-id
#   env      = module.dev-vpc1.env
#   ingress_rules = [
#     {
#       description = "Allows ssh traffic",
#       port        = 22,
#       cidr_blocks = ["0.0.0.0/0"],
#     },
#     {
#       description = "Allows http traffic",
#       port        = 80,
#       cidr_blocks = ["0.0.0.0/0"],
#     },
#     {
#       description = "Allows https traffic",
#       port        = 443,
#       cidr_blocks = ["0.0.0.0/0"],
#     }
#   ]
#   egress_rules = [
#     {
#       description = "Allows all egress traffic",
#       port        = 0,
#       cidr_blocks = ["0.0.0.0/0"],
#     }
#   ]
# }