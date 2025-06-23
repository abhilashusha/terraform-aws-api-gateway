# Module      : Api Gateway
# Description : Terraform Api Gateway module outputs.
output "id" {
  value       = [for r in aws_api_gateway_rest_api.default : r.id]
  description = "The IDs of the REST APIs."
}

output "execution_arn" {
  value       = [for r in aws_api_gateway_rest_api.default : r.execution_arn]
  description = "The Execution ARNs of the REST APIs."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "authorizer_id" {
  value = aws_api_gateway_authorizer.default[*].id
}

output "base_urls" {
  value = aws_api_gateway_stage.default[*].invoke_url
}
