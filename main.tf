module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id     = module.vpc.vpc_id
  admin_cidr = var.admin_cidr
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "iam" {
  source = "./modules/iam"

  bucket_arn = module.s3.bucket_arn
}