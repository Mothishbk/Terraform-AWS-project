terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket         = "terraform-demo-eks-bucket-state"
        key            = "terraform.tfstate"
        region         = "ap-south-1"
        dynamodb_table = "terraform-demo-eks-table"
        encrypt        = true
    }
}

provider "aws" {
    region  = "ap-south-1"
}

module "vpc" {
    source = "./MODULE/VPC" # module location

    cluster_name         = var.cluster_name
    vpc_cidr             = var.vpc_cidr
    public_subnet_cidrs  = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    availability_zones   = var.availability_zones
}


module "eks" {
    source = "./MODULE/EKS" # module location

    cluster_name         = var.cluster_name
    vpc_id               = module.vpc.vpc_id
    subnet_ids           = module.vpc.private_subnet_ids
    cluster_version = var.cluster_version

    node_groups = var.node_groups
    
}