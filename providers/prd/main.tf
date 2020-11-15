terraform {
  backend "local" {
    path = "../.terraform/terraform_local.tfstate"
  }

  required_version = "= 0.13.0"
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
  version = "= 3.3.0"
}


data "aws_region" "current" {
}

locals {
  prefix = "${var.env}-${var.project_name}-${replace(data.aws_region.current.name, "-", "")}"

  common_tags = {
    env          = var.env
    project_name = var.project_name
    region       = var.region
  }
}

