module "public_eks_cluster" {
 # note update the source link with the required version
  source         = "git::https://github.com/Noura98Houssien/simple-EKS-cluster.git?ref=vx.x.x"
  vpc_name       = "my-VPC1"
  cluster_name   = "my-EKS1"
  desired_size   = 2
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}