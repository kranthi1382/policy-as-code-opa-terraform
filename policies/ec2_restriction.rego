package terraform.analysis

allowed = {"t3.micro", "t3.small"}

deny[msg] if {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"

  instance := resource.change.after.instance_type
  not allowed[instance]

  msg := sprintf("Instance type not allowed: %v", [instance])
}