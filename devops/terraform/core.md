# Terraform — Core

## HCL Syntax

```hcl
# Block types
terraform { ... }      # Terraform settings
provider "aws" { ... } # Provider config
resource "type" "name" { ... }  # Managed resource
data "type" "name" { ... }      # Data source
variable "name" { ... }         # Input variable
output "name" { ... }           # Output value
locals { ... }                   # Local values
module "name" { ... }           # Module call

# Types
string, number, bool
list(type), set(type), map(type)
object({ key = type }), tuple([type, ...])

# Expressions
"Hello ${var.name}"           # String interpolation
condition ? true_val : false  # Conditional
var.list[0]                   # Index
var.map["key"]                # Key lookup
[for x in var.list : upper(x)]  # For expression
```

## Providers

```hcl
terraform {
  required_version = ">= 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

# Use aliased provider
resource "aws_instance" "west_server" {
  provider = aws.west
  ami      = "ami-123"
}
```

## Resources and Data Sources

```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  count         = 2                     # Create multiple

  tags = {
    Name = "web-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [tags]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
}

# for_each instead of count
resource "aws_iam_user" "users" {
  for_each = toset(["alice", "bob", "charlie"])
  name     = each.value
}
```

## Variables

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
  validation {
    condition     = can(regex("^t3\\.", var.instance_type))
    error_message = "Must be a t3 instance type."
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "webapp"
  }
}

variable "config" {
  type = object({
    port    = number
    enabled = bool
  })
}

# Input via CLI: terraform apply -var="instance_type=t3.small"
# Input via file: terraform apply -var-file="dev.tfvars"

output "instance_ip" {
  description = "Public IP of web server"
  value       = aws_instance.web.public_ip
  sensitive   = false
}

locals {
  common_tags = merge(var.tags, {
    ManagedBy = "terraform"
  })
  app_name = "${var.project}-${var.environment}"
}
```

## State Management

```hcl
# Remote state with S3 + DynamoDB locking
terraform {
  backend "s3" {
    bucket         = "my-tf-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
}

# Terraform Cloud backend
terraform {
  backend "remote" {
    organization = "myorg"
    workspaces {
      name = "production"
    }
  }
}
```

```bash
terraform state list                  # List resources in state
terraform state show aws_instance.web # Show resource details
terraform state mv                    # Move resource in state
terraform state rm                    # Remove from state
terraform import aws_instance.web i-1234567890  # Import existing
terraform refresh                     # Sync state with real infra
```

## Modules

```hcl
# Using a module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
}

# Referencing module outputs
resource "aws_instance" "web" {
  subnet_id = module.vpc.public_subnet_ids[0]
}

# Local module
module "app" {
  source = "./modules/app"

  vpc_id    = module.vpc.vpc_id
  name      = "myapp"
  instances = 3
}
```

### Module structure

```
modules/
  app/
    main.tf       # Resources
    variables.tf  # Input variables
    outputs.tf    # Outputs
```

## Workspaces

```bash
terraform workspace list          # List workspaces
terraform workspace new staging   # Create workspace
terraform workspace select prod   # Switch workspace
terraform workspace show          # Current workspace
```

```hcl
# Use workspace in config
resource "aws_instance" "web" {
  instance_type = terraform.workspace == "prod" ? "t3.large" : "t3.micro"
  tags = {
    Environment = terraform.workspace
  }
}
```

## Provisioners

```hcl
resource "aws_instance" "web" {
  ami           = "ami-123"
  instance_type = "t3.micro"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> inventory.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}
```

## Best Practices

- **Pin versions**: always set `required_version` and provider `version` constraints
- **Remote state**: use S3+DynamoDB or Terraform Cloud for team projects
- **Separate environments**: use workspaces or directory structure (`envs/prod/`, `envs/staging/`)
- **Module composition**: break large configs into reusable modules
- **terraform fmt**: format all `.tf` files consistently
- **terraform validate**: run in CI before apply
- **Never commit state**: add `*.tfstate*` to `.gitignore`
- **Use `moved` blocks**: for safe refactoring instead of `terraform state mv`

## See Also

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [HCL Specification](https://developer.hashicorp.com/terraform/language/syntax)
- [Terraform Registry](https://registry.terraform.io)
- [Terraform State Management](https://developer.hashicorp.com/terraform/language/state)
