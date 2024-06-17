module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.name
  cluster_version = var.eks_version

  cluster_enabled_log_types      = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cluster_endpoint_public_access = false

  cluster_addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids

  enable_irsa                              = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    karpenter = {

      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]

      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 2

      labels = {
        role = "karpenter"
      }

      taints = {
        addons = {
          key    = "CriticalAddonsOnly"
          value  = "true"
          effect = "NO_SCHEDULE"
        }
      }

      instance_type = "t3.small"
      capacity_type = "ON_DEMAND"

      tags = {
        "k8s.io/cluster-autoscaler/enabled"   = "true"
        "k8s.io/cluster-autoscaler/karpenter" = "true"
        "karpenter.sh/discovery"              = var.name
      }
    }
  }
  # Configs for spot instances and general instances
  #      general = {
  #      desired_capacity = 2
  #      max_capacity     = 2
  #      min_capacity     = 1
  #
  #      labels = {
  #        role = "general"
  #      }
  #
  #      instance_type = "t3.small"
  #      capacity_type = "ON_DEMAND"
  #    }
  #
  #    spot = {
  #      desired_capacity = 2
  #      max_capacity     = 2
  #      min_capacity     = 1
  #
  #      labels = {
  #        role = "spot"
  #      }
  #
  #      taints = [{
  #        key   = "market"
  #        value = "spot"
  #        effect = "NO_SCHEDULE"
  #      }]
  #
  #      instance_type = "t3.small"
  #      capacity_type = "SPOT"
  #    }
  #  }
}
