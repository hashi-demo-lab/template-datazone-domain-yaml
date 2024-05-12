data "aws_caller_identity" "current" {}

locals {
  datzone_config          = yamldecode(file("${path.module}${var.datazone_domain_yaml_file}"))
  datazone_domain   = local.datzone_config.datazone
}

output "datzone_config" {
  value = local.datzone_config
  description = "datazone yaml"
}


module "datazone_domain" {
  source  = "app.terraform.io/tfc-demo-au/datazone-domain/awscc"
  version = "~>  0.2.5"

  aws_account                 = data.aws_caller_identity.current.account_id
  datazone_domain_name        = local.datazone_domain.datazone_domain_name
  datazone_description        = local.datazone_domain.datazone_description
  datazone_kms_key_identifier = local.datazone_domain.datazone_kms_key_identifier
  single_sign_on              = local.datazone_domain.single_sign_on
  tags                        = local.datazone_domain.tags
  region                      = local.datazone_domain.region

  environment_blueprints = local.datazone_domain.environment_blueprints
  datazone_projects      = local.datazone_domain.datazone_projects

}



