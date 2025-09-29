variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  
}
variable "subnet_ids" {
  description = "The IDs of the subnets to use for the EKS cluster"
  type        = list(string)
}

variable "node_groups" {
  
    description = "The configuration for the EKS node groups"
    type = map(object({
        instance_types = list(string)
        capacity_type  = string
        scaling_config = object({
            desired_size = number
            max_size     = number
            min_size     = number
        })
    }))
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
