variable "name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = ""
}

variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}
