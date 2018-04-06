provider "aws" {
  # XXX Provisionally pass arguments.Eventually set as environment variable
  access_key = "${ var.access_key }"
  secret_key = "${ var.secret_key }"
  region = "${ var.region }"
}

module "ec2" {
  source = "./modules/compute"
  environment = "${ var.environment }"
  ami = "${ var.ami }"
  ec2_front {
    instance_type =  "${ var.ec2_front["instance_type"] }"
    count = "${ var.ec2_front["count"] }"
  }
}
