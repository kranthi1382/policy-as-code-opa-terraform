package terraform.analysis

deny[msg] if {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  resource.change.after.acl == "public-read"

  msg := "S3 bucket should not be public"
}