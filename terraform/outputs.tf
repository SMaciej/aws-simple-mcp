output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.mcp_server.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.mcp_server.arn
}

output "lambda_function_url" {
  description = "Lambda function URL"
  value       = aws_lambda_function_url.mcp_server.function_url
}

output "api_gateway_url" {
  description = "API Gateway invoke URL"
  value       = var.create_api_gateway ? aws_api_gateway_deployment.mcp_api[0].invoke_url : "Not created"
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group name"
  value       = aws_cloudwatch_log_group.lambda_logs.name
}

output "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
  value       = aws_iam_role.lambda_role.arn
}
