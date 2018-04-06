variable access_key {}
variable secret_key {}

# general variables
variable "environment" {}

variable region {
  default = "ap-northeast-1"
}

variable domain {
  default = "kpter.net"
}

# ec2 variables
variable ami {}
variable ec2_front {
  type = "map"
}
