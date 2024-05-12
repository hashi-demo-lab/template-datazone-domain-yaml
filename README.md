## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_datazone_domain"></a> [datazone\_domain](#module\_datazone\_domain) | app.terraform.io/tfc-demo-au/datazone-domain/awscc | ~>  0.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datazone_description"></a> [datazone\_description](#input\_datazone\_description) | The description of the aws datazone domain | `string` | `"AWS DataZone Domain"` | no |
| <a name="input_datazone_domain_name"></a> [datazone\_domain\_name](#input\_datazone\_domain\_name) | The name of the aws datazone domain | `string` | n/a | yes |
| <a name="input_datazone_kms_key_identifier"></a> [datazone\_kms\_key\_identifier](#input\_datazone\_kms\_key\_identifier) | The KMS key identifier to use for encryption | `string` | `null` | no |
| <a name="input_datazone_projects"></a> [datazone\_projects](#input\_datazone\_projects) | The projects to deploy | <pre>map(object({<br>    description    = optional(string)<br>    glossary_terms = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_environment_blueprints"></a> [environment\_blueprints](#input\_environment\_blueprints) | The environment blueprints to deploy | <pre>map(object({<br>    enabled_regions                  = list(string)<br>    environment_blueprint_identifier = string<br>    provisioning_role_arn            = optional(string)<br>    manage_access_role_arn           = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the domain | `string` | n/a | yes |
| <a name="input_single_sign_on"></a> [single\_sign\_on](#input\_single\_sign\_on) | The single sign on configuration | <pre>map(object({<br>    type            = optional(string)<br>    user_assignment = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to the domain | <pre>set(object({<br>    key   = string<br>    value = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_awscc_executionrole"></a> [awscc\_executionrole](#output\_awscc\_executionrole) | The AWS Control Tower Execution Role |
| <a name="output_datazone_domain_id"></a> [datazone\_domain\_id](#output\_datazone\_domain\_id) | The ID of the DataZone Domain |
| <a name="output_datazone_portal"></a> [datazone\_portal](#output\_datazone\_portal) | The DataZone Portal |
| <a name="output_datazone_role_arn"></a> [datazone\_role\_arn](#output\_datazone\_role\_arn) | The ARN of the DataZone Role |
| <a name="output_datazone_role_id"></a> [datazone\_role\_id](#output\_datazone\_role\_id) | The ID of the DataZone Role |
| <a name="output_datazone_status"></a> [datazone\_status](#output\_datazone\_status) | The DataZone Status |
| <a name="output_environment_project_id"></a> [environment\_project\_id](#output\_environment\_project\_id) | The ID of the Environment Project |
| <a name="output_s3_datazone"></a> [s3\_datazone](#output\_s3\_datazone) | The S3 DataZone Bucket |
| <a name="output_s3_datazone_region"></a> [s3\_datazone\_region](#output\_s3\_datazone\_region) | The S3 DataZone Bucket Region |
