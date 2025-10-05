# Terraform EC2 Instance Deployment

This project uses **Terraform** to create an **AWS EC2 instance** with a **Security Group**, **Key Pair**, and **User Data** script for automatically installing **NGINX** on the instance.

---

## ✨ Features
- Creates an AWS Key Pair  
- Sets up a Security Group with:
  - **SSH (port 22)** access  
  - **HTTP (port 80)** access  
- Launches an EC2 instance with NGINX auto-installation via user data script  
- Outputs the **Public IP** and **Public DNS** of the instance  
- Uses a separate `terraform.tf` file for provider configuration  

---

## ⚙️ Files Overview

| File | Description |
|------|-------------|
| `ec2.tf` | Contains EC2 instance, key pair, and security group configuration |
| `terraform.tf` | Defines the provider (AWS) and region setup |
| `outputs.tf` | Displays instance public IP and DNS after apply |
| `nginxinstall.sh` | User data script to install NGINX on instance |
| `.gitignore` | Excludes sensitive and temporary Terraform files |
| `README.md` | Project documentation |

---

## 🚀 Terraform Commands

### 1️⃣ Initialize Terraform
```bash
terraform init
terraform plan
terraform apply
