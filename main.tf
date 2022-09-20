module "aft" {
  source = "git@github.com:aws-ia/terraform-aws-control_tower_account_factory.git"

  # Required Parameters
  ct_management_account_id    = "560488923178"
  log_archive_account_id      = "238924973923"
  audit_account_id            = "068751534662"
  aft_management_account_id   = "347104041295"
  ct_home_region              = "ap-southeast-1"
  tf_backend_secondary_region = "ap-southeast-2"

  # Optional Parameters
  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/learn-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/learn-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/learn-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/learn-terraform-aft-account-customizations"

  # VPC Parameters
  aft_vpc_cidr                   = "10.0.0.0/18"
  aft_vpc_private_subnet_01_cidr = "10.0.0.0/20"
  aft_vpc_private_subnet_02_cidr = "10.0.16.0/20"
  aft_vpc_public_subnet_01_cidr  = "10.0.32.0/20"
  aft_vpc_public_subnet_02_cidr  = "10.0.48.0/20"

  # Optional Feature Flags
  aft_feature_delete_default_vpcs_enabled = true
  aft_feature_cloudtrail_data_events      = false
  aft_feature_enterprise_support          = false
}
