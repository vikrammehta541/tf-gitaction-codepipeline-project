# 🚀 Terraform EC2 Deployment via GitHub Actions and AWS CodePipeline

## 🎯 Objective

Build a CI/CD workflow to provision and destroy an EC2 instance using Terraform, triggered by GitHub Actions, monitored with AWS CodePipeline, and store infrastructure state in Amazon S3 securely.

Provision and manage an **EC2 instance using Terraform**, triggered via **GitHub Actions**, monitored through **AWS CodePipeline**, and backed by **Amazon S3** + **DynamoDB** for state management.


---

## 🧱 Architecture

```
             ┌──────────────┐
             │   GitHub     │
             └─────┬────────┘
                   │ Push
                   ▼
         ┌────────────────────┐
         │   GitHub Actions   │
         │ (Terraform Apply)  │
         └──────┬─────────────┘
                │
                ▼
     ┌────────────────────────┐
     │     AWS Resources      │
     │  (EC2 Instance)        │
     └────────┬───────────────┘
              │
              ▼
     ┌────────────────────────┐
     │ S3 + DynamoDB Backend  │
     │ (Terraform State)      │
     └────────┬───────────────┘
              ▲
              │
     ┌────────┴────────┐
     │ AWS CodePipeline│
     │ (Webhook + Visual) │
     └─────────────────┘
```

---

## 🛠️ Project Structure

- **Terraform Files**:
  - `main.tf` – EC2 resource
  - `provider.tf` – AWS provider config
  - `backend.tf` – Remote backend setup
  - `outputs.tf`, `variables.tf`

- **GitHub Workflows**:
  - `.github/workflows/deploy-ec2.yml`
  - `.github/workflows/destroy-ec2.yml`

---

## ⚙️ Workflows Summary

### `deploy-ec2.yml`

Triggered on push to `main`, runs:
- `terraform init`
- `terraform plan`
- `terraform apply`

### `destroy-ec2.yml`

Manual workflow, runs:
- `terraform destroy`

---

## 💾 Backend Configuration

```hcl
backend "s3" {
  bucket         = "vhm-terraform-state-bucket"
  key            = "Projects/tf-gitaction-codepipeline-project/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "vhm-db-terraform-locks"
}
```

---

## 🧪 Common Mistakes & Fixes

| Mistake | Fix |
|--------|------|
| Webhook missing | Re-authorize GitHub App via CodeStar |
| Invalid provider block | Added `provider "aws"` with region |
| Incorrect backend key | Used proper S3 path with `/` |
| State not persisted | Configured S3 + DynamoDB backend |
| Pipeline not triggering | Installed GitHub App & granted repo access |

---

## 🎓 Key Learnings

- Use **GitHub (v2)** and CodeStar for webhook-based triggers.
- Store `.tfstate` in S3 to keep Terraform state between runs.
- Always define your `provider` block explicitly.
- Use **GitHub Secrets** to securely pass AWS credentials.

---

## ✅ Result

- ✅ Automatic EC2 provisioning from GitHub
- 🔁 Destroy infra with manual trigger
- 📦 State managed securely in S3
- 👀 Visual execution in AWS CodePipeline

---

> Built with ❤️ using Terraform, GitHub Actions, and AWS.
