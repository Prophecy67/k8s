provider "aws" {
  region = "eu-west-1"
  access_key = "xxx"
  secret_key = "xxx"
  }

module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  cluster_name                    = "my-cluster"
  cluster_endpoint_private_access = "true"

  subnets = ["10.0.0.1", "10.0.1.1"
  ]

  vpc_id = "test"

  worker_groups = [
    {
      instance_type       = "m4.large"
      asg_max_size        = 5
      propagate_at_launch = true
    },
  ]

  tags = {
    environment = "test"
  }
}
