provider "aws" {
  region = "eu-west-1"
}

module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  cluster_name                    = "my-cluster"
  cluster_endpoint_private_access = "true"

  subnets = [
    data.terraform_remote_state.vpc.outputs.aws_subnet_jenkins-subnet-eu-west-1a,
    data.terraform_remote_state.vpc.outputs.aws_subnet_jenkins-subnet-eu-west-1b,
  ]

  vpc_id = data.terraform_remote_state.vpc.outputs.aws_vpc_vpc-jenkins

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
