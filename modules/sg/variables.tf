variable "vpc_name" {}
variable "env" {}
variable "vpc_id" {}
variable "ingress_rules" {
  type        = list(any)           ## specifying variable type is not mandatory but recommended for best practices
}
variable "egress_rules" {
  type        = list(any)
}
