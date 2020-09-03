## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| attributes | Additional attributes (e.g., `one', or `two') | `list` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes` | `string` | `"-"` | no |
| environment | Environment (e.g. `test`, `dev`) | `string` | `""` | no |
| iam\_policy\_arns | List of IAM Policy ARNs to be attached to the role | `list` | n/a | yes |
| name | Name  (e.g. `app` or `database`) | `string` | n/a | yes |
| namespace | Namespace (e.g. `org`) | `string` | n/a | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Additional tags (e.g. map(`Visibility`,`Public`) | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_role\_arn | The Amazon Resource Name (ARN) specifying the instance role |
| instance\_role\_id | The stable and unique string identifying the instance role |
| instance\_role\_name | The name of the IAM instance role created |

