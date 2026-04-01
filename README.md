# 🚀 Policy-as-Code with OPA & Terraform

## 📌 Overview

This project demonstrates **Policy-as-Code implementation using Open Policy Agent (OPA)** to validate Terraform infrastructure before deployment.

It enforces **security and compliance rules automatically** during Pull Requests using GitHub Actions, ensuring that only compliant infrastructure changes are merged.

---

## 🎯 Key Features

* ✅ Terraform plan validation before deployment
* ✅ Policy enforcement using OPA (Rego language)
* ✅ CI/CD integration with GitHub Actions
* ✅ Automatic PR blocking on policy violations
* ✅ Infrastructure security & governance automation

---

## 🧱 Tech Stack

* Terraform
* Open Policy Agent (OPA)
* Rego (Policy Language)
* GitHub Actions
* AWS (S3, EC2)

---

## 📁 Project Structure

```
policy-as-code/
│
├── .github/workflows/
│   └── terraform-validation.yml
│
├── policies/
│   ├── base_tags.rego
│   ├── s3_protection.rego
│   └── ec2_restriction.rego
│
├── terraform/
│   ├── main.tf
│   └── variables.tf
│
├── scripts/
│   └── opa-check.sh
│
└── README.md
```

---

## 🔐 Policies Implemented

### 1️⃣ Mandatory Tagging Policy

Ensures all resources include required tags:

* Environment
* Owner
* Project

---

### 2️⃣ S3 Security Policy

* ❌ Blocks public S3 buckets
* ✅ Allows only private access

---

### 3️⃣ EC2 Instance Restriction Policy

* ✅ Allowed: `t3.micro`, `t3.small`
* ❌ Blocks other instance types

---

## ⚙️ How It Works

```
Developer → Push Code → Create Pull Request
↓
GitHub Actions Triggered
↓
Terraform Plan Generated
↓
OPA Evaluates Policies
↓
PASS / FAIL Decision
```

---

## 🚀 CI/CD Workflow

* Trigger: Pull Request
* Terraform plan is generated
* Plan converted to JSON
* OPA evaluates policies
* ❌ Fails if violations found
* ✅ Passes if compliant

---

## ❌ Example Policy Violation

```hcl
instance_type = "t2.large"
```

Result:

```
❌ POLICY VIOLATIONS:
Instance type not allowed
```

---

## ✅ Example Passing Configuration

```hcl
instance_type = "t3.micro"

tags = {
  Environment = "dev"
  Owner       = "kranthi"
  Project     = "OPA"
}
```

---

## 🔑 GitHub Secrets Required

Add the following secrets in repository settings:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

---

## 🧠 Key Learnings

* Policy-as-Code implementation
* Infrastructure security automation
* CI/CD pipeline integration
* Terraform + OPA workflow
* PR-based validation system

---

## 💼 Use Case

This project simulates real-world DevOps practices where infrastructure changes are automatically validated to ensure compliance before deployment.

---

## 🏆 Outcome

* Automated infrastructure governance
* Reduced manual review effort
* Improved security posture
* Consistent policy enforcement

---

## 👨‍💻 Author

**Kranthi**
