variable "name" {
  description = "Name of the cluster."
}

variable "region" {
  description = "AWS region the cluster will reside in."
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR."
}

variable "subnet_addtl_bits" {
  default     = 4
  description = <<EOF
Additional bits added to VPC CIDR for subnets, to determine cluster subnet size.
e.g. a VPC CIDR of 10.0.0.0/16 and 4 additional bits will yield 10.0.*.0/20 subnets.
EOF
}

variable "num_zones" {
  default     = 2
  description = <<EOF
Number of availability zones the cluster will reside in.
This needs to be at least 2, due to EKS restrictions.
See https://aws.amazon.com/about-aws/global-infrastructure/regions_az/ for more details.
EOF
}

variable "disk_size" {
  default     = 100
  description = "Disk size for nodes"
}

variable "instance_type" {
  default     = "t3.medium"
  description = "Instance type for nodes"
}

variable "desired_size" {
  default     = 2
  description = <<EOF
Autoscaling group desired size for nodes. This value is only used initially on cluster creation.
Changes made externally to this value (i.e. through the AWS console, or via autoscaling processes)
will not be overridden.
EOF
}

variable "min_size" {
  default     = 2
  description = "Autoscaling group minimum size for nodes."
}

variable "max_size" {
  default     = 4
  description = "Autoscaling group maximum size for nodes."
}
