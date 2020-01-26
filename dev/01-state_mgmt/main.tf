module "remote_state" {
  source            = "git::https://github.com/saurabh-hirani/terraform-aws-state-mgmt.git?ref=v0.0.2"
  state_bucket_name = "sample-app-tf-state-bucket"
  force_destroy     = true

  versioning_config = {
    enabled = true
  }

  create_log_bucket = true
  logging_config = {
    target_bucket = "sample-app-tf-state-bucket-logs"
    target_prefix = "logs/"
  }

  lock_table_name = "sample-app-tf-lock-table"

  tags = var.tags
}
