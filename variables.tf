variable "region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.1.0/24" 
}

variable "instance_type" {
  description = "The instance type for the EC2 server."
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "The name for the AWS Key Pair."
  type        = string
  default     = "exam-key"
}

variable "public_key_path" {
  description = "The local path to your public SSH key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub" 
}