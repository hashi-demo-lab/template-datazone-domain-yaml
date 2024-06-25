data "aws_caller_identity" "current" {}

locals {
  datazone_config          = yamldecode(file("${path.module}/config/${var.datazone_domain_yaml_file}"))
  datazone_domain   = local.datazone_config.datazone
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




/* variable "revision" {
  default = "1"
} */


/* resource "terraform_data" "env" { 
  input = var.revision

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOF
set -e
CREDENTIALS=(`aws sts assume-role-with-web-identity --role-arn arn:aws:iam::855831148133:role/tfc-tfc-demo-au-retail_data_plaform --role-session-name build-session --web-identity-token $(cat $HOME/tfc-aws-token) --duration-seconds 1000 \
  --query "[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]" \
  --output text`)

unset AWS_PROFILE
export AWS_DEFAULT_REGION=ap-southeast-2
export AWS_ACCESS_KEY_ID="$${CREDENTIALS[0]}"
export AWS_SECRET_ACCESS_KEY="$${CREDENTIALS[1]}"
export AWS_SESSION_TOKEN="$${CREDENTIALS[2]}"
EOF
  }
}

resource "terraform_data" "aws" {
  depends_on = [ terraform_data.env ]
  for_each = module.datazone_domain.projects
  
  input = var.revision

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOF
set -e
aws datazone create-project-membership --domain-identifier ${each.value.domain_id} --designation PROJECT_OWNER --region ${local.datazone_domain.region} --project-identifier ${each.value.project_id} --member '{"userIdentifier":"arn:aws:iam::855831148133:role/aws_simon.lynch_test-developer"}' --output json || :
EOF
  }
}
 */
