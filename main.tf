provider "aws" {
  region = var.region
}

locals {
  landingzone_manifest_template = <<EOF
{
    "governedRegions": ${jsonencode(var.governed_regions)},
    "organizationStructure": {
        "security": {
            "name": "Core"
        }
    },
    "centralizedLogging": {
         "accountId": "${module.aws_core_accounts.log_account_id}",
         "configurations": {
             "loggingBucket": {
                 "retentionDays": ${var.retention_days}
             },
             "accessLoggingBucket": {
                 "retentionDays": ${var.retention_days}
             }
         },
         "enabled": true
    },
    "securityRoles": {
         "accountId": "${module.aws_core_accounts.security_account_id}"
    },
    "accessManagement": {
         "enabled": true
    }
}
EOF
}

module "aws_core_accounts" {
  source = "github.com/nitheeshp-irl/blog-terraform-modules//aws_core_accounts_module"

  logging_account_email  = var.logging_account_email
  logging_account_name   = var.logging_account_name
  security_account_email = var.security_account_email
  security_account_name  = var.security_account_name
}

module "aws_landingzone" {
  source                  = "github.com/nitheeshp-irl/blog-terraform-modules//aws_landingzone_module"
  manifest_json           = local.landingzone_manifest_template
  landingzone_version     = var.landingzone_version
  administrator_account_id = var.administrator_account_id
}
