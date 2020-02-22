## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| aws.us-east-1 | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| costs\_threshold | The threshold of cost for the budget | `string` | n/a | yes |
| instance\_tags | A map of tags you want to add to the instances | `map(string)` | n/a | yes |
| key\_name | Name of the SSH key that you attach to the instances | `string` | n/a | yes |
| nginx\_instances\_count | Number of aws\_instances that we want to have | `number` | n/a | yes |
| user | user specfic information | `map(string)` | n/a | yes |
| sms\_sender\_id | SMS Sender ID | `string` | `"AWSpersonal"` | no |

## Outputs

| Name | Description |
|------|-------------|
| my\_web\_server\_info | n/a |
| this\_load\_balancer\_dns\_name | n/a |

