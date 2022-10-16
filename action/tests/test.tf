variable "vpc_id" {
  description = "The id of the vpc"
  type        = "string"
}

variable "subnet_ids" {
  description = "A list of subnet ids to use"
  type        = "list"
}

variable "instance_name" {
  description = "Instance name prefix"
  type        = "string"
  default     = "test-1"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = "string"
  default     = "2"
}

variable "test" {
  description = "variable1"
  type        = "string"
  default     = "this is variable 2"
}


provider "aws" {
  region  = "us-east-1"
  version = "< 2.2.0"
}

provider "consul" {
  alias   = "ae1"
  version = ">= 1.0.0"
}

data "aws_acm_certificate" "test-cert" {
  domain   = "test.example.com"
  statuses = ["ISSUED"]
}

data "consul_key" "test" {
  key {
    name    = "test"
    path    = "examples/test.json"
    default = "{}"
  }
}