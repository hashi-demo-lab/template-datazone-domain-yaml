output "datazone_role_id" {
  value = module.datazone_domain.datazone_role_id
  description = "The ID of the DataZone Role"
}

output "datazone_role_arn" {
  value = module.datazone_domain.datazone_role_arn
  description = "The ARN of the DataZone Role"
}

output "datazone_domain_id" {
  value = module.datazone_domain.datazone_domain_id
  description = "The ID of the DataZone Domain"
}

output "datazone_environment_blueprints" {
  value = module.datazone_domain.datazone_environment_blueprints
  description = "DataZone environment blueprints"
}

output "projects" {
  value = module.datazone_domain.projects
  description = "The ID of the Environment Project"
}

output "s3_datazone" {
  value = module.datazone_domain.s3_datazone
  description = "The S3 DataZone Bucket"
}

output "s3_datazone_region" {
  value = module.datazone_domain.s3_datazone_region
  description = "The S3 DataZone Bucket Region"
}

output "datazone_portal" {
  value = module.datazone_domain.datazone_portal
  description = "The DataZone Portal"
}

output "datazone_status" {
  value = module.datazone_domain.datazone_status
  description = "The DataZone Status"
}

output "awscc_executionrole" {
  value = module.datazone_domain.awscc_executionrole
  description = "The AWS Control Tower Execution Role"
}