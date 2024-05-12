provider "awscc" {
    region = local.datazone_domain.region
}

provider "aws" {
    region = local.datazone_domain.region
}