resource "aws_s3_bucket" "public" {
  bucket = "${ var.environment }-${ var.domain }-public"
  acl = "public-read"

  tags {
    Name = "My bucket"
    Environment = "${ var.environment }"
  }
}
