# The process of requesting and verifying a certificate in ACM requires some manual steps,
# which means that Terraform cannot automate the creation of ACM certificates.
# c.f. https://www.terraform.io/docs/providers/aws/d/acm_certificate.html

# if environment is not prod, domain will add to the start of domain.
# e.g. if environment is stage and domain is "example.com", domain will be "stage.example.com"
data "aws_acm_certificate" "front" {
  domain = "${var.environment == "prod" ? var.domain : "${var.environment}.${var.domain}" }"
  statuses = ["ISSUED"]
  types = ["AMAZON_ISSUED "]
}
