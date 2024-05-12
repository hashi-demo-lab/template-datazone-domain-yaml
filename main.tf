data "aws_caller_identity" "current" {}

module "datazone_domain" {
  source  = "app.terraform.io/tfc-demo-au/datazone-domain/awscc"
  version = "~>  0.2.5"

  aws_account                 = data.aws_caller_identity.current.account_id
  datazone_domain_name        = var.datazone_domain_name
  datazone_description        = var.datazone_domain_name
  datazone_kms_key_identifier = var.datazone_kms_key_identifier
  single_sign_on              = var.single_sign_on
  tags                        = var.tags
  region                      = var.region

  environment_blueprints = var.environment_blueprints
  datazone_projects      = var.datazone_projects

}
