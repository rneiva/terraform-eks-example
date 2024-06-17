output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.eks.cluster_arn
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_status" {
  description = "The status of the EKS cluster"
  value       = module.eks.cluster_status
}
