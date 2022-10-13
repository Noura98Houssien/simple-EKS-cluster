module "public_eks_cluster" {
  source         = "git::https://github.com/Noura98Houssien/simple-EKS-cluster.git?ref=v0.0.1"
  vpc_name       = "my-VPC1"
  cluster_name   = "my-EKS1"
  desired_size   = 2
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}