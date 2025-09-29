variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  
}
variable "cluster_name" {
  description = "The name of the cluster"
  type        = string

}
variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  

}   
variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}
variable "availability_zones" {
  description = "The availability zones to use for the subnets"
  type        = list(string)
}