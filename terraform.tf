terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
 backend "s3" {
  bucket = "3167-0494-2911"
  key = "terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "my-terraform-backend-table"
}

}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

