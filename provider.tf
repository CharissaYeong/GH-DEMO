terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}


terraform {
  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"
    key    = "ysw-gh-demo/terraform.tfstate"
    region = "ap-southeast-1"
  }
}