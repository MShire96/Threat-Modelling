terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket       = "moh-threat-model"
    key          = "tf-state-setup"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

