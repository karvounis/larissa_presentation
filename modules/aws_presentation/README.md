## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ami\_id | The AMI ID that the instances are going to use | `string` | n/a | yes |
| aws\_instances\_count | Number of aws\_instances that we want to have | `number` | `0` | no |
| create\_lb | Should be true if you want to create a load balancer | `bool` | `false` | no |
| instance\_tags | A map of tags you want to add to the instances | `map(string)` | `{}` | no |
| instances\_vpc\_security\_group\_ids | A list of ids of security groups to attach to instances | `list(string)` | `[]` | no |
| key\_name | Name of the SSH key that you attach to the instances | `string` | `""` | no |
| lb\_security\_group\_ids | A list of the ids of security groups to attach to the load balancer | `list(string)` | `[]` | no |
| vpc\_id | ID of the VPC to spin up the resources inside | `string` | `""` | no |
| vpc\_subnet\_ids | A list of subnet ids | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| my\_web\_server\_info | n/a |
| this\_load\_balancer\_dns\_name | n/a |
| this\_load\_balancer\_target\_id | n/a |

