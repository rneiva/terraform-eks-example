variable "environment" {
  description = "The environment to deploy resources"
  type        = string
  default     = ""
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = ""
}

variable "profile" {
  description = "The AWS profile to use"
  type        = string
  default     = "default"
}

variable "allowed_account_ids" {
  description = "A list of AWS account IDs that are allowed to assume the role"
  type        = list(string)
  default     = []
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "vpc_azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = ""
}
