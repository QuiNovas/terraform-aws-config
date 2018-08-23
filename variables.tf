variable "account_name" {
  description = "The name of the account."
  type        = "string"
}

variable "log_bucket" {
  description = "The log bucket to write S3 logs to."
  type        = "string"
}
