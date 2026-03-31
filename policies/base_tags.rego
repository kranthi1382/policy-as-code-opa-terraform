package terraform.analysis

deny[msg] if {
  resource := input.resource_changes[_]
  resource.change.actions[_] == "create"

  required_tags := {"Environment", "Owner", "Project"}
  missing := required_tags - {tag | resource.change.after.tags[tag]}

  count(missing) > 0

  msg := sprintf("Missing tags: %v", [missing])
}