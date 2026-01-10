resource "aws_api_gateway_rest_api" "mcp_api" {
  count       = var.create_api_gateway ? 1 : 0
  name        = "${var.project_name}-${var.environment}-api"
  description = "MCP Server API Gateway"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "proxy" {
  count       = var.create_api_gateway ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.mcp_api[0].id
  parent_id   = aws_api_gateway_rest_api.mcp_api[0].root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  count         = var.create_api_gateway ? 1 : 0
  rest_api_id   = aws_api_gateway_rest_api.mcp_api[0].id
  resource_id   = aws_api_gateway_resource.proxy[0].id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  count                   = var.create_api_gateway ? 1 : 0
  rest_api_id             = aws_api_gateway_rest_api.mcp_api[0].id
  resource_id             = aws_api_gateway_resource.proxy[0].id
  http_method             = aws_api_gateway_method.proxy[0].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.mcp_server.invoke_arn
}

resource "aws_api_gateway_deployment" "mcp_api" {
  count       = var.create_api_gateway ? 1 : 0
  depends_on  = [aws_api_gateway_integration.lambda]
  rest_api_id = aws_api_gateway_rest_api.mcp_api[0].id
  stage_name  = var.environment
}
