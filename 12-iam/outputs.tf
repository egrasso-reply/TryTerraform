output "additive_role" {
  value = google_project_iam_member.demo_additive.role
}

output "authoritative_role" {
  value = google_project_iam_binding.demo_authoritative.role
}
