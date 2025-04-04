variable "aws_region" {
}
variable "cluster_name" {
}
# variable "vpc_id" {  
# }
variable "subnet_ids" {
  type    = list(string)  
}
variable "image" {  
}
variable "namespace" {
  default = "default"
}

variable "env" {
  default = "dev"
}
