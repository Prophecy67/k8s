data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../aws/vpc/eu-west-1/terraform.tfstate"
  }
}
