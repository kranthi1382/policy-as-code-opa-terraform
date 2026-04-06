provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "kranthi-demo-bucket-12345"
  acl    = "public"   # ❌ should fail

  tags = {
  Environment = "dev"
  Owner       = "kranthi"
  Project     = "OPA"
}
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.large"   # ❌ should fail

  tags = {
  Environment = "dev"
  Owner       = "kranthi"
  Project     = "OPA"
 }
}