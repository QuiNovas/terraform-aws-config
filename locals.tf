locals {
  config_name = "${var.name}-config"
  default_input_parameters = {
    acm-certificate-expiration-check = <<PARAMS
{
  "daysToExpiration": "30"
}
PARAMS

    iam-password-policy = <<PARAMS
{
  "RequireUppercaseCharacters": "true",
  "RequireLowercaseCharacters": "true",
  "RequireSymbols": "true",
  "RequireNumbers": "true",
  "MinimumPasswordLength": "30",
  "PasswordReusePrevention": "24",
  "MaxPasswordAge": "30"
}
PARAMS

}
default_scopes = {
default = {
tag_key   = ""
tag_value = ""
}
}
default_scope_key = "default"
default_source_identifiers = {
acm-certificate-expiration-check                        = "ACM_CERTIFICATE_EXPIRATION_CHECK"
aproved-amis-by-id                                      = "APPROVED_AMIS_BY_ID"
approved-amis-by-tag                                    = "APPROVED_AMIS_BY_TAG"
autoscaling-group-elb-healthcheck-required              = "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED"
cloudformation-stack-notification-check                 = "CLOUDFORMATION_STACK_NOTIFICATION_CHECK"
cloudtrail-enabled                                      = "CLOUD_TRAIL_ENABLED"
cloudwatch-alarm-action-check                           = "CLOUDWATCH_ALARM_ACTION_CHECK"
cloudwatch-alarm-resource-check                         = "CLOUDWATCH_ALARM_RESOURCE_CHECK"
cloudwatch-alarm-settings-check                         = "CLOUDWATCH_ALARM_SETTINGS_CHECK"
codebuild-project-envvar-awscred-check                  = "CODEBUILD_PROJECT_ENVVAR_AWSCRED_CHECK"
codebuild-project-source-repo-url-check                 = "CODEBUILD_PROJECT_SOURCE_REPO_URL_CHECK"
db-instance-backup-enabled                              = "DB_INSTANCE_BACKUP_ENABLED"
desired-instance-tenancy                                = "DESIRED_INSTANCE_TENANCY"
desired-instance-type                                   = "DESIRED_INSTANCE_TYPE"
dynamodb-autoscaling-enabled                            = "DYNAMODB_AUTOSCALING_ENABLED"
dynamodb-throughput-limit-check                         = "DYNAMODB_THROUGHPUT_LIMIT_CHECK"
ebs-optimized-instance                                  = "EBS_OPTIMIZED_INSTANCE"
ec2-instance-detailed-monitoring-enabled                = "EC2_INSTANCE_DETAILED_MONITORING_ENABLED"
ec2-instance-managed-by-ssm                             = "EC2_INSTANCE_MANAGED_BY_SSM"
ec2-instances-in-vpc                                    = "INSTANCES_IN_VPC"
ec2-managedinstance-applications-blacklisted            = "EC2_MANAGEDINSTANCE_APPLICATIONS_BLACKLISTED"
ec2-managedinstance-applications-required               = "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED"
ec2-managedinstance-association-compliance-status-check = "EC2_MANAGEDINSTANCE_ASSOCIATION_COMPLIANCE_STATUS_CHECK"
ec2-managedinstance-inventory-blacklisted               = "EC2_MANAGEDINSTANCE_INVENTORY_BLACKLISTED"
ec2-managedinstance-patch-compliance-status-check       = "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK"
ec2-managedinstance-platform-check                      = "EC2_MANAGEDINSTANCE_PLATFORM_CHECK"
ec2-volume-inuse-check                                  = "EC2_VOLUME_INUSE_CHECK"
eip-attached                                            = "EIP_ATTACHED"
elb-acm-certificate-required                            = "ELB_ACM_CERTIFICATE_REQUIRED"
elb-custom-security-policy-ssl-check                    = "ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK"
elb-predefined-security-policy-ssl-check                = "ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK"
encrypted-volumes                                       = "ENCRYPTED_VOLUMES"
fms-webacl-resource-policy-check                        = "FMS_WEBACL_RESOURCE_POLICY_CHECK"
fms-webacl-rulegroup-association-check                  = "FMS_WEBACL_RULEGROUP_ASSOCIATION_CHECK"
guardduty-enabled-centralized                           = "GUARDDUTY_ENABLED_CENTRALIZED"
iam-password-policy                                     = "IAM_PASSWORD_POLICY"
iam-group-has-users-check                               = "IAM_GROUP_HAS_USERS_CHECK"
iam-policy-blacklisted-check                            = "IAM_POLICY_BLACKLISTED_CHECK"
iam-user-group-membership-check                         = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
iam-user-no-policies-check                              = "IAM_USER_NO_POLICIES_CHECK"
lambda-function-settings-check                          = "LAMBDA_FUNCTION_SETTINGS_CHECK"
lambda-function-public-access-prohibited                = "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED"
rds-multi-az-support                                    = "RDS_MULTI_AZ_SUPPORT"
rds-snapshots-public-prohibited                         = "RDS_SNAPSHOTS_PUBLIC_PROHIBITED"
rds-storage-encrypted                                   = "RDS_STORAGE_ENCRYPTED"
redshift-cluster-configuration-check                    = "REDSHIFT_CLUSTER_CONFIGURATION_CHECK"
redshift-cluster-maintenancesettings-check              = "REDSHIFT_CLUSTER_MAINTENANCESETTINGS_CHECK"
required-tags                                           = "REQUIRED_TAGS"
restricted-common-ports                                 = "RESTRICTED_INCOMING_TRAFFIC"
restricted-ssh                                          = "INCOMING_SSH_DISABLED"
root-account-mfa-enabled                                = "ROOT_ACCOUNT_MFA_ENABLED"
s3-blacklisted-actions-prohibited                       = "S3_BLACKLISTED_ACTIONS_PROHIBITED"
s3-bucket-logging-enabled                               = "S3_BUCKET_LOGGING_ENABLED"
s3-bucket-policy-not-more-permissive                    = "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE"
s3-bucket-public-read-prohibited                        = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
s3-bucket-public-write-prohibited                       = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
s3-bucket-replication-enabled                           = "S3_BUCKET_REPLICATION_ENABLED"
s3-bucket-server-side-encryption-enabled                = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
s3-bucket-ssl-requests-only                             = "S3_BUCKET_SSL_REQUESTS_ONLY"
s3-bucket-versioning-enabled                            = "S3_BUCKET_VERSIONING_ENABLED"
}
scopes             = merge(local.default_scopes, var.scopes)
source_identifiers = merge(local.default_source_identifiers, var.source_identifiers)
input_parameters   = merge(local.default_input_parameters, var.input_parameters)
}

