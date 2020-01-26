output "tf_bucket_id" {
  value       = module.remote_state.tf_state_bucket.id
  description = "Terraform bucket ID"
}

output "tf_lock_table_name" {
  value       = module.remote_state.tf_lock_table.*.name
  description = "Terraform lock table ID"
}

output "tf_log_bucket" {
  value       = module.remote_state.tf_log_bucket.*.id
  description = "Terraform log bucket ID"
}
