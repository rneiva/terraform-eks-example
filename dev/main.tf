terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
  default_tags {
    tags = {
      app   = "eks"
      owner = "devops"
      iac   = "true"
      env   = var.environment
    }
  }
  allowed_account_ids = var.allowed_account_ids
}

module "vpc" {
  source = "../modules/vpc"

  name            = var.vpc_name
  cidr            = var.vpc_cidr
  azs             = var.vpc_azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "eks" {
  source = "../modules/eks_cluster"

  name        = var.cluster_name
  eks_version = var.cluster_version
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnets
}

module "karpenter" {
  source = "../modules/karpenter"

  cluster_name = var.cluster_name
  depends_on   = [module.eks]
}
