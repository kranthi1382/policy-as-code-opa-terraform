#!/bin/bash

RESULT=$(opa eval \
  --input tfplan.json \
  --data policies/ \
  "data.terraform.analysis.deny")

echo "$RESULT"

VIOLATIONS=$(echo "$RESULT" | jq -r '.result[0].expressions[0].value[]')

if [[ -n "$VIOLATIONS" ]]; then
  echo "Policy violations found:"
  echo "$VIOLATIONS"
  exit 1
fi

echo "All policies passed"