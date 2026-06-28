# Terraform

Terraform is an open-source infrastructure as code (IaC) tool by HashiCorp that provisions and manages cloud resources declaratively using HCL (HashiCorp Configuration Language).

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | HCL syntax, providers, resources, variables, state, modules, workspaces |

## Quick Reference

### Provider

```hcl
terraform {
  required_version = ">= 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "my-tf-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
```

### Resource

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name = "web-server"
  }
}
```

### Variable and Output

```hcl
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
```

### Commands

```bash
terraform init        # Initialize (download providers)
terraform plan        # Preview changes
terraform apply       # Apply changes
terraform destroy     # Tear down resources
terraform fmt         # Format code
terraform validate    # Validate config
terraform output      # Show outputs
terraform state list  # List state resources
```
