## Scope
This module creates a simple EKS cluster with basic requirements as in the [AWS documentation](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html) using infrastructure as a code tool [Terraform](https://www.terraform.io/) 

To know more please visit [my article](https://dev.to/aws-builders/create-a-simple-eks-cluster-394a) on dev.io I explained how to create a public EKS cluster in more detail 
## Getting started

There are two ways to use this module 

**The first way:**

1- `git clone https://github.com/Noura98Houssien/simple-EKS-cluster.git`

2- `cd simple-EKS-cluster `

3- create a file with the name terraform.tfvars and copy past the values as in [terraform.tfvars.tmpl](https://github.com/Noura98Houssien/simple-EKS-cluster/blob/master/examples/terraform.tfvars.tmpl) in the example folder
```
vpc_name       = "my-VPC1"
vpc_cidr       = "10.0.0.0/16"
cluster_name   = "my-EKS1"
desired_size   = 2
max_size       = 2
min_size       = 1
instance_types = ["t3.medium"]

```
3- `terraform init`

4- `terraform plan`

5- `terraform apply`


**The second way:**

You need to replace vx.x.x with a required version and include that call in your code as [simple-eks-cluster.tf](https://github.com/Noura98Houssien/simple-EKS-cluster/blob/master/examples/public-eks-cluster.tf) at example folder.

```
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
```



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.73 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git | v3.16.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eksClusterRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eksWorkerNodeRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-\_]+$). | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired size of the worker node, the default value is 2 | `number` | `2` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types associated with the EKS Node Group. the default vaule is ["t3.medium"]. Terraform will only perform drift detection if a configuration value is provided. | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the worker node, the default value is 2 | `number` | `2` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the worker node, the default value is 1 | `number` | `1` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The Cidr of VPC where cluster will be created on, the default value is "10.0.0.0/16" | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC where cluster will be created on | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | EKS Cluster ARN |
| <a name="output_cert"></a> [cert](#output\_cert) | Certificate authority |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. |
| <a name="output_host"></a> [host](#output\_host) | Endpoint for your Kubernetes API server. |
| <a name="output_id"></a> [id](#output\_id) | Name of the cluster. |
| <a name="output_identity"></a> [identity](#output\_identity) | Attribute block containing identity provider information for your cluster |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC associated with your cluster. |
<!-- END_TF_DOCS -->

## License
[GNU General Public License v3.0](https://github.com/Noura98Houssien/simple-EKS-cluster/blob/master/LICENSE)
