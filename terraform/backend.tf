terraform {
  backend "s3" {
    bucket         = "mcp-example-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}
