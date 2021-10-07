provider "aws" {
  profile = "default"
  region  = "us-east-1"
  shared_credentials_file = "C:/Users/Sreenath/.aws/credentials"
}
resource "aws_s3_bucket" "terraform_vpc" {
  bucket = "my-tf-test-bucket-sree-s123"
  acl    = "private"
}



# access_key = "AKIAT57BV3QSFDR5XZ5U"
# secret_key = "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"