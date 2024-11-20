variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-2"
}

variable "landingzone_version" {
  description = "The version of the AWS Landing Zone module to use"
  type        = string
  default     = "3.3"
}

variable "governed_regions" {
  description = "List of governed regions"
  type        = list(string)
  default     = ["us-east-2", "us-west-2"]
}

variable "retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 60  # You can set a default value or leave it empty
}

variable "landingzone_manifest" {
  description = "The JSON content for the AWS Landing Zone manifest"
  type        = string
  default     = ""
}

variable "logging_account_email" {
  description = "The email Id for centralized logging account"
  type        = string
}

variable "logging_account_name" {
  description = "Name for centralized logging account"
  type        = string
}

variable "security_account_email" {
  description = "The email Id for security roles account"
  type        = string
}

variable "security_account_name" {
  description = "Name for security roles account"
  type        = string
}

variable "administrator_account_id" {
  description = "AWS Account Id of the administrator account (the account in which StackSets will be created)"
  type        = string
  validation {
    condition     = length(var.administrator_account_id) == 12
    error_message = "The administrator account ID must be exactly 12 characters long."
  }
}