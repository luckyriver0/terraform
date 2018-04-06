variable access_key {}
variable secret_key {}

# prod, stage, dev. recieve from terraform -var="environment=xxx"
variable "environment" {}

variable region {
  default = "ap-northeast-1"
}

variable ami {}
variable ec2_front {
  type = "map"
}
